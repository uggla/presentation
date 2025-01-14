#!/bin/bash

set -euo pipefail

slides_dir=${1:-}

if [[ -z "$slides_dir" ]]; then
  echo "Use $0 slide_dir to build the pdf for a specific slide_dir."
  exit 1
fi

if ! [[ -f /usr/bin/podman ]]; then
  echo "podman is not available."
  exit 1
fi

set +e
#shellcheck disable=SC2009
server=$(ps -ef | grep "python3 \(\./\)\?[s]erver.py")
set -e

if [[ -z "$server" ]]; then
  echo "Document is not served, please run uv run server.py."
  exit 1
fi

current_dir=$(pwd)
cd "$(dirname "$0")"
cd "../${slides_dir}"

podman run -ti --userns=keep-id --rm -v "$PWD":/data:Z -e "HOSTNAME=$HOSTNAME" -e "OUTPUT=${slides_dir}" localhost/build_pdf:latest

cd "${current_dir}"
exit 0
