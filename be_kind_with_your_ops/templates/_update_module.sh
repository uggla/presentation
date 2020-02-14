#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

declare -rl MODULE=${1-null}
declare -r VERSION=${2-null}
# shellcheck disable=SC2155
declare -rl SCRIPT_NAME=$(basename "${0}")
# shellcheck disable=SC2155
declare -rl DIR_NAME=$(dirname "${0}")
# shellcheck disable=SC2155
declare -r CURDIR=$(pwd)
# shellcheck disable=SC2155

main() {
  cd "${DIR_NAME}"
  check_parameters
  check_binaries
  ...
  cd "${CURDIR}"
}

main
