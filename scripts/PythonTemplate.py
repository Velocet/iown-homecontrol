#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""A one-line description or name.

A longer description that spans multiple lines.  Explain the purpose of the
file and provide a short list of the key classes/functions it contains.  This
is the docstring shown when some does 'import foo;foo?' in IPython, so it
should be reasonably useful and informative.
"""
# -----------------------------------------------------------------------------
# Copyright (c) 2015, the IPython Development Team and José Fonseca.
#
# Distributed under the terms of the Creative Commons License.
#
# The full license is in the file LICENSE.txt, distributed with this software.
#
#
# REFERENCES:
# http://ipython.org/ipython-doc/rel-0.13.2/development/coding_guide.html
# https://www.python.org/dev/peps/pep-0008/
# -----------------------------------------------------------------------------
'''
OPTIONS ------------------------------------------------------------------
A description of each option that can be passed to this script

ARGUMENTS -------------------------------------------------------------
A description of each argument that can or must be passed to this script
'''

# -----------------------------------------------------------------------------
# Imports
# -----------------------------------------------------------------------------

# stdlib imports -------------------------------------------------------

# Third-party imports -----------------------------------------------

# Our own imports ---------------------------------------------------


# -----------------------------------------------------------------------------
# GLOBALS
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# CONSTANTS
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# LOCAL UTILITIES
# -----------------------------------------------------------------------------
# Changes the default string encoding to UTF-8
import sys
reload(sys)
sys.setdefaultencoding("utf-8")  # @UndefinedVariable


# -----------------------------------------------------------------------------
# CLASSES
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------

def main():
    '''
    Complete description of the method, what it does and how it should be used
    :param argv: type - description of the nth argument
    '''
    # what this variable means and how it is calculated
    args = sys.argv[1:]

    # Print help if module is started without arguments
    if not args:
        print('usage: [--flags options] [inputs] ')
        sys.exit(1)

# FUNCTION CATEGORY 1 -----------------------------------------
def main(arg1, arg2):
    '''
    Complete description of the method, what it does and how it should be used
    :param arg1: type - description of the 1st argument
    :param arg2: type - description of the 2nd argument
    :return: type - description of the value returned
    :timeComplexityTerm TERM_X: type - term used in the Complexity formula
    :timeComplexityDominantOperation  OP_X: type - operation considered to
        calculate the time complexity of this method
    :timeComplexity: O(OP_X*TERM_X²)
    '''
    # what this variable means and how it is calculated
    stall = arg1
    # what is being calculated, and what are the parameters and values used
    stall = arg2 - foo(arg1, stall)

    return None


# FUNCTION CATEGORY 2 -----------------------------------------


# FUNCTION CATEGORY n -----------------------------------------


# -----------------------------------------------------------------------------
# RUNTIME PROCEDURE
# -----------------------------------------------------------------------------
if __name__ == '__main__':
    '''
    Complete description of the runtime of the script, what it does and how it
    should be used
    :timeComplexityTerm TERM_X: type - term used in the Complexity formula
    :timeComplexityDominantOperation  OP_X: type - operation considered to
        calculate the time complexity of this method
    :timeComplexity: O(OP_X*TERM_X²)
    '''
    # description of the operation perfomed Below
    foo(1, 2)
