#!/usr/bin/python

import sys

# Get command line parameters


def usage():
    print('{} usage:\n'.format(sys.argv[0]))
    print('bidule: do somethin great.')

if('bidule' in sys.argv):
    print('Bidule')
if('-h' in sys.argv):
    usage()
