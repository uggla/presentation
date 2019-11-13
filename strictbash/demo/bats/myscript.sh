#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

CURDIR=$(pwd)
declare -l ARG1=${1:--h}
declare -l ARG2=${2:-}

usage() {
  echo "usage: myscript"
  echo "blabla"
  exit 1
}

option_o() {
  echo "Option -o"
  #exit 2
}

main() {
  if [[ "${ARG1}" == "-h" ]]; then
    usage
  fi

  if [[ "${ARG1}" == "-o" ]]; then
    option_o
  fi

  echo "Do stuff"
}

main
