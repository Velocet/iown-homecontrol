#!/usr/bin/env python3

import argparse
import json
import logging
import os
import shutil
import subprocess
import sys
from contextlib import suppress
from pathlib import Path
from tempfile import TemporaryDirectory

VERSION = '0.1.1'
NAME = 'FACT_extractor interface'
DEFAULT_CONTAINER = 'fkiecad/fact_extractor'


def parse_arguments():
    parser = argparse.ArgumentParser(
        description='Command line interface for FACT_extractor.\nExtract arbitrary container or compression formats with one utility.'
    )
    parser.add_argument('-v', '--version', action='version', version=set_version())
    parser.add_argument('-c', '--container', help='docker container', default=DEFAULT_CONTAINER)
    parser.add_argument('-m', '--memory', help='memory limit for docker container (in MB)', default='512')
    parser.add_argument('-o', '--output_directory', help='path to extracted files', default=None)
    parser.add_argument('-r', '--report_file', help='write report to a file', default=None)
    parser.add_argument('-V', '--verbose', action='store_true', default=False, help='increase verbosity')
    parser.add_argument('-e', '--extract_everything', action='store_true', help='also extract empty files')
    parser.add_argument('FILE', type=str, nargs=1, help='File for extraction')
    return parser.parse_args()


def setup_logging(verbose):
    console_log = logging.StreamHandler()
    console_log.setFormatter(
        logging.Formatter(fmt='[%(asctime)s][%(module)s][%(levelname)s]: %(message)s', datefmt='%Y-%m-%d %H:%M:%S')
    )

    logger = logging.getLogger('')
    logger.setLevel(logging.DEBUG if verbose else logging.INFO)
    logger.addHandler(console_log)


def container_exists(container):
    return subprocess.run(f'docker history {container}', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).returncode == 0


def default_container_status():
    format_parameter = '{{.Tag}},{{.CreatedAt}}'
    try:
        process_result = subprocess.run(
            f'docker image ls {DEFAULT_CONTAINER} --format "{format_parameter}"',
            shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT
        )
        tag, creation_time = process_result.stdout.decode().strip().split(',')
    except ValueError:
        tag, creation_time = 'n/e', 'n/e'
    return tag, creation_time


def set_version():
    container_tag, container_creation = default_container_status()

    return (
        f'{NAME}\n'
        f'Programm version:\t{VERSION}\n'
        f'Default container:\t{DEFAULT_CONTAINER}\n'
        f'Container tag:\t\t{container_tag}\n'
        f'Container creation:\t{container_creation}'
    )


def call_docker(input_file, container, target, report_file, memory_limit, tmpdir=None, extract_everything=False):
    arguments = f'--chown {os.getuid()}:{os.getgid()}'
    arguments += ' --extract_everything' if extract_everything else ''
    tmpdir = tmpdir if tmpdir else TemporaryDirectory()

    try:
        for subpath in ['files', 'reports', 'input']:
            Path(tmpdir.name, subpath).mkdir(exist_ok=True)

        shutil.copy(input_file, str(Path(tmpdir.name, 'input', Path(input_file).name)))

        command = f'docker run --rm -m {memory_limit}m -v {tmpdir.name}:/tmp/extractor -v /dev:/dev --privileged {container} {arguments}'
        subprocess.run(command, shell=True)

        with suppress(shutil.Error):
            shutil.copytree(str(Path(tmpdir.name, 'files')), target)

        handle_report(report_file, tmpdir.name)
    finally:
        tmpdir.cleanup()


def handle_report(report_file, tmp):
    indented_report = json.dumps(json.loads(Path(tmp, 'reports', 'meta.json').read_text()), indent=4)
    if report_file:
        Path(report_file).write_text(indented_report)
    else:
        print(indented_report)


def main():
    arguments = parse_arguments()
    setup_logging(arguments.verbose)

    output_directory = arguments.output_directory if arguments.output_directory else str(Path('.') / 'extracted_files')
    if Path(output_directory).exists():
        logging.error(f'Target directory exists ({output_directory}). Please choose a non-existing directory with -o option.')
        return 1

    if not container_exists(arguments.container):
        logging.error(f'Container {arguments.container} doesn\'t exist. Please specify an existing container with the -c option.')
        logging.info(f'You can download the default container with "docker pull {DEFAULT_CONTAINER}"')
        return 1

    if not Path(arguments.FILE[0]).is_file():
        logging.error(f'Given input file {arguments.FILE[0]} doesn\'t exist. Please give an existing path.')
        return 1

    if arguments.report_file and not Path(arguments.report_file).parent.is_dir():
        logging.error(f'Report file ({arguments.report_file}) can not be created. Check if parent directory exists.')
        return 1

    if arguments.report_file and Path(arguments.report_file).exists():
        logging.warning('Warning: Report file will be overwritten.')

    call_docker(
        input_file=arguments.FILE[0],
        container=arguments.container,
        target=output_directory,
        report_file=arguments.report_file,
        memory_limit=arguments.memory,
        extract_everything=arguments.extract_everything
    )

    return 0


if __name__ == '__main__':
    sys.exit(main())
