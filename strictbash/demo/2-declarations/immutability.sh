#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

declare -r MONDAY=0
var="I'm global"
var2="I'm global too"

my_function() {
  var="I'm local"
  local var2="I'm local too"
  echo "- Inside function"
  echo "${var}"
  echo "${var2}"
}

echo "- Before function"
echo "${var}"
echo "${var2}"
my_function
echo "- After function"
echo "${var}"
echo "${var2}"

# Attempt to re affect MONDAY
echo "${MONDAY}"
MONDAY=3
