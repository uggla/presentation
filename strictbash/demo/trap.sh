#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

_exit() {
  echo "Exit time"
  date -Iseconds
  exit 2
}

trap _exit SIGINT

date -Iseconds
sleep 5m
