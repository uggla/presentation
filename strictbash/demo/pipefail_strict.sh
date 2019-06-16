#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

grep some-string /non/existent/file | sort
echo $?
