#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo "wget 'https://www.gnu.org/graphics/babies/BabyGnu.png' \n
      wget 'https://download.tuxfamily.org/libergnu/igzz/2014/10/gnu-fsf.png' \n
      wget 'https://www.gnu.org/graphics/bahlon/3d-gnu-head.jpg'" |
  parallel
