#!/usr/bin/python

# coding=utf-8

'''
redfish-client ::

 Usage:
   redfish-client [options] config add <manager_name> <manager_url> [<login>] [<password>]
   redfish-client [options] config del <manager_name>
   redfish-client [options] config modify <manager_name> (manager_name | url | login | password) <changed_value>
   redfish-client [options] config show
   redfish-client [options] config showall
   redfish-client [options] manager getinfo [<manager_name>]
   redfish-client [options] chassis getinfo [<manager_name>]
   redfish-client [options] system getinfo [<manager_name>]
   redfish-client (-h | --help)
   redfish-client --version
 
 
 Options:
   -h --help            Show this screen.
   --version            Show version.
   -c --config FILE     Configuration file
   -i --inventory FILE  Configuration file [default: $HOME/.redfish/inventory]
   --insecure           Ignore SSL certificates
   --debug LEVEL        Run in debug mode, LEVEL from 1 to 3 increase verbosity
                        Security warning LEVEL > 1 could reveal password into the logs
   --debugfile FILE     Specify the client debugfile [default: $HOME/.redfish/redfish-client.log]
   --libdebugfile FILE  Specify python-redfish library log file [default: $HOME/.redfish/python-redfish.log]
 
 config commands : manage the configuration file.
 manager commands : manage the manager (Light out management). If <manager_name>
                    is not provided use the 'default' entry
'''


from docopt import docopt
from pprint import pprint

arguments = docopt(__doc__, version='1.0')
pprint(arguments)
