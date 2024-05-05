#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
PlatformIO Extras Script

Examples: https://docs.platformio.org/en/latest/scripting/examples/index.html
"""

__author__ = "Velocet"
__copyright__ = "Copyleft 2024, Velocet"
__license__ = "MIT"
__version__ = "0.6.9"
__maintainer__ = "Velocet"
__email__ = "git@mail.velocet.de"
__status__ = "Development"

import os

""" Install Missed Package on Import """
try:
    Import("env") # SCons
except ImportError:
    # env.Execute("$PYTHONEXE -m pip install some_package")
    print('Fix this shit idiot!')


def main():
    """ PlatformIO Extras Script """

    """ Construction Environment
    https://docs.platformio.org/en/latest/scripting/construction_environments.html
    """
    # print(env.Dump())        # """ Dump global """
    # print(projenv.Dump())    # """ Dump Project """
    # Import("env", "projenv") # """ Import `projenv` to `env` variable. Alias of `env = DefaultEnvironment()` """

    """ Extra Linker Flags
    https://docs.platformio.org/en/latest/scripting/examples/extra_linker_flags.html
    """
    # env.Append(LINKFLAGS=["-static", "...", "..."])

    """ Generate compile_commands.json with toolchain includes for each enviroment and save database to 'build_dir/envname'.
    https://docs.platformio.org/en/latest/integration/compile_commands.html
    """
    # env.Replace(COMPILATIONDB_INCLUDE_TOOLCHAIN=True) # include toolchain paths
    # env.Replace(COMPILATIONDB_PATH=os.path.join("$BUILD_DIR", "compile_commands.json")) # override compilation DB path

    """ Custom Firmware/Program Name: Add a Project Version suffix to the Firmware Name
    https://docs.platformio.org/en/latest/scripting/examples/custom_program_name.html
    """
    # env.Replace(PROGNAME="iown_%s" % env.GetProjectOption("custom_iown_version"))

    """ Asking for Input (prompts)
    https://docs.platformio.org/en/latest/scripting/examples/asking_for_input.html
    """
    # NOTE Do not run script when app (eg. IDEs) dumps integration data or this will block the process waiting for user input
    # TODO Use as a input for custom board configs?
    # if env.IsIntegrationDump(): Return() # stop script execution
    # else: # Ask user name
    #     print("Enter your name:")
    #     user_name = input()
    #     env.Append(CPPDEFINES=[("USER_NAME",  env.StringifyMacro(user_name))],)

    """ Extra Python packages
    https://docs.platformio.org/en/latest/scripting/examples/extra_python_packages.html
    """
    # env.Execute("$PYTHONEXE -m pip install pkg1") # Install package from PyPi

    print("PlatformIO Extras Script v", __version__)


if __name__ == "__main__":
    """ Command Line Execution """
    main()
