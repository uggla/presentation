#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
docopt_sample.py
Display the square of a given number

Usage:
    docopt_sample.py <square>
    docopt_sample.py (-h | --help)
    docopt_sample.py --version

Options:
    -h --help     Show this screen.
    --version     Show version.

<square> : number to square

"""

from docopt import docopt
from pprint import pprint

arguments = docopt(__doc__, version='1.0')
pprint(arguments)
