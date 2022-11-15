#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import http.server
import socketserver
import os
import subprocess
import sys

PORT = 8000
FILTERED_DIRS = [
    "reveal.js",
    "common",
    ".git",
    "ansible",
    "docker6anniversary",
    "docopt",
    "redfish",
]
Handler = http.server.SimpleHTTPRequestHandler

def check_tools():
    try:
        subprocess.check_output(
            "which staticjinja >/dev/null 2>&1"
            ,shell=True
        )

        if not os.path.exists("reveal.js/package.json"):
            raise FileNotFoundError
    except subprocess.CalledProcessError:
        print(
            "staticjinja is missing, "
            "Please install it with pip install staticjinja",
            file=sys.stderr
        )
        sys.exit(1)
    except FileNotFoundError:
        print(
            "Could not find reveal.js, "
            "Please get the submodules using "
            "git submodule init && git submodule update",
            file=sys.stderr
        )


def serve_content():
    with socketserver.TCPServer(("", PORT), Handler) as httpd:
        print("serving at http://localhost:{}".format(PORT))
        httpd.serve_forever()

def build_presentations():
    directories = []
    for dir in os.listdir("."):
        if dir not in FILTERED_DIRS and os.path.isdir(dir):
            directories.append(dir)

    for dir in directories:
        print("Building presentation for {}".format(dir))
        os.chdir(dir)
        subprocess.check_output("staticjinja build", shell=True)
        os.chdir("..")

def main():
    check_tools()
    build_presentations()
    serve_content()


if __name__ == "__main__":
    main()
