#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

hyperfine ./no_parallel.sh ./parallel.sh -r 2 -s nocolor

# Clean up
rm ./*.jpg* ./*.png*
