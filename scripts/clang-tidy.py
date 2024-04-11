#!/usr/bin/env python3

from helpers import (
    print_error_for_file,
    get_output,
    filter_grep,
    build_all_include,
    temp_header_file,
    git_ls_files,
    filter_changed,
    load_idedata,
    root_path,
    basepath,
    get_binary,
)
import argparse
import click
import colorama
import multiprocessing
import os
import queue
import re
import shutil
import subprocess
import sys
import tempfile
import threading



def clang_options(idedata):
    cmd = []

    # extract target architecture from triplet in g++ filename
    triplet = os.path.basename(idedata["cxx_path"])[:-4]
    if triplet.startswith("xtensa-"):
        # clang doesn't support Xtensa (yet?), so compile in 32-bit mode and pretend we're the Xtensa compiler
        cmd.append("-m32")
        cmd.append("-D__XTENSA__")
    else:
        cmd.append(f"--target={triplet}")

    # set flags
    cmd.extend(
        [
            # disable built-in include directories from the host
            "-nostdinc",
            "-nostdinc++",
            # replace pgmspace.h, as it uses GNU extensions clang doesn't support
            # https://github.com/earlephilhower/newlib-xtensa/pull/18
            "-D_PGMSPACE_H_",
            "-Dpgm_read_byte(s)=(*(const uint8_t *)(s))",
            "-Dpgm_read_byte_near(s)=(*(const uint8_t *)(s))",
            "-Dpgm_read_word(s)=(*(const uint16_t *)(s))",
            "-Dpgm_read_dword(s)=(*(const uint32_t *)(s))",
            "-DPROGMEM=",
            "-DPGM_P=const char *",
            "-DPSTR(s)=(s)",
            # this next one is also needed with upstream pgmspace.h
            # suppress warning about identifier naming in expansion of this macro
            "-DPSTRN(s, n)=(s)",
            # suppress warning about attribute cannot be applied to type
            # https://github.com/esp8266/Arduino/pull/8258
            "-Ddeprecated(x)=",
            # allow to condition code on the presence of clang-tidy
            "-DCLANG_TIDY",
            # (esp-idf) Disable this header because they use asm with registers clang-tidy doesn't know
            "-D__XTENSA_API_H__",
            # (esp-idf) Fix __once_callable in some libstdc++ headers
            "-D_GLIBCXX_HAVE_TLS",
        ]
    )

    # copy compiler flags, except those clang doesn't understand.
    cmd.extend(
        flag
        for flag in idedata["cxx_flags"]
        if flag
        not in (
            "-free",
            "-fipa-pta",
            "-fstrict-volatile-bitfields",
            "-mlongcalls",
            "-mtext-section-literals",
            "-mfix-esp32-psram-cache-issue",
            "-mfix-esp32-psram-cache-strategy=memw",
            "-fno-tree-switch-conversion",
        )
    )

    # defines
    cmd.extend(f"-D{define}" for define in idedata["defines"])

    # add toolchain include directories using -isystem to suppress their errors
    # idedata contains include directories for all toolchains of this platform, only use those from the one in use
    toolchain_dir = os.path.normpath(f"{idedata['cxx_path']}/../../")
    for directory in idedata["includes"]["toolchain"]:
        if directory.startswith(toolchain_dir):
            cmd.extend(["-isystem", directory])

    # add library include directories using -isystem to suppress their errors
    for directory in sorted(set(idedata["includes"]["build"])):
        # skip our own directories, we add those later
        if not directory.startswith(f"{root_path}/") or directory.startswith(
            f"{root_path}/.pio/"
        ):
            cmd.extend(["-isystem", directory])

    # add the esphome include directory using -I
    cmd.extend(["-I", root_path])

    return cmd


pids = set()

def run_tidy(executable, args, options, tmpdir, queue, lock, failed_files):
    while True:
        path = queue.get()
        invocation = [executable]

        if tmpdir is not None:
            invocation.append("--export-fixes")
            # Get a temporary file. We immediately close the handle so clang-tidy can
            # overwrite it.
            (handle, name) = tempfile.mkstemp(suffix=".yaml", dir=tmpdir)
            os.close(handle)
            invocation.append(name)

        if args.quiet:
            invocation.append("--quiet")

        if sys.stdout.isatty():
            invocation.append("--use-color")

        invocation.append(f"--header-filter={os.path.abspath(basepath)}/.*")
        invocation.append(os.path.abspath(path))
        invocation.append("--")
        invocation.extend(options)

        proc = subprocess.run(invocation, capture_output=True, encoding="utf-8")
        if proc.returncode != 0:
            with lock:
                print_error_for_file(path, proc.stdout)
                failed_files.append(path)
        queue.task_done()


def progress_bar_show(value):
    if value is None:
        return ""


def split_list(a, n):
    k, m = divmod(len(a), n)
    return [a[i * k + min(i, m) : (i + 1) * k + min(i + 1, m)] for i in range(n)]


def main():
    colorama.init()

    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-j",
        "--jobs",
        type=int,
        default=multiprocessing.cpu_count(),
        help="number of tidy instances to be run in parallel.",
    )
    parser.add_argument(
        "-e",
        "--environment",
        default="esp32-arduino-tidy",
        help="the PlatformIO environment to use (as defined in platformio.ini)",
    )
    parser.add_argument(
        "files", nargs="*", default=[], help="files to be processed (regex on path)"
    )
    parser.add_argument("--fix", action="store_true", help="apply fix-its")
    parser.add_argument(
        "-q", "--quiet", action="store_false", help="run clang-tidy in quiet mode"
    )
    parser.add_argument(
        "-c", "--changed", action="store_true", help="only run on changed files"
    )
    parser.add_argument("-g", "--grep", help="only run on files containing value")
    parser.add_argument(
        "--split-num", type=int, help="split the files into X jobs.", default=None
    )
    parser.add_argument(
        "--split-at", type=int, help="which split is this? starts at 1", default=None
    )
    parser.add_argument(
        "--all-headers",
        action="store_true",
        help="create a dummy file that checks all headers",
    )
    args = parser.parse_args()

    idedata = load_idedata(args.environment)
    options = clang_options(idedata)

    files = []
    for path in git_ls_files(["*.cpp"]):
        files.append(os.path.relpath(path, os.getcwd()))

    if args.files:
        # Match against files specified on command-line
        file_name_re = re.compile("|".join(args.files))
        files = [p for p in files if file_name_re.search(p)]

    if args.changed:
        files = filter_changed(files)

    if args.grep:
        files = filter_grep(files, args.grep)

    files.sort()

    if args.split_num:
        files = split_list(files, args.split_num)[args.split_at - 1]

    if args.all_headers and args.split_at in (None, 1):
        build_all_include()
        files.insert(0, temp_header_file)

    tmpdir = None
    if args.fix:
        tmpdir = tempfile.mkdtemp()

    failed_files = []
    try:
        executable = get_binary("clang-tidy", 14)
        task_queue = queue.Queue(args.jobs)
        lock = threading.Lock()
        for _ in range(args.jobs):
            t = threading.Thread(
                target=run_tidy,
                args=(executable, args, options, tmpdir, task_queue, lock, failed_files),
            )
            t.daemon = True
            t.start()

        # Fill the queue with files.
        with click.progressbar(
            files, width=30, file=sys.stderr, item_show_func=progress_bar_show
        ) as bar:
            for name in bar:
                task_queue.put(name)

        # Wait for all threads to be done.
        task_queue.join()

    except FileNotFoundError as ex:
        return 1
    except KeyboardInterrupt:
        print()
        print("Ctrl-C detected, goodbye.")
        if tmpdir:
            shutil.rmtree(tmpdir)
        # Kill subprocesses (and ourselves!)
        # No simple, clean alternative appears to be available.
        os.kill(0, 9)
        return 2    # Will not execute.

    if args.fix and failed_files:
        print("Applying fixes ...")
        try:
            subprocess.call(["clang-apply-replacements-14", tmpdir])
        except:
            print("Error applying fixes.\n", file=sys.stderr)
            raise

    return len(failed_files)


if __name__ == "__main__":
    sys.exit(main())
