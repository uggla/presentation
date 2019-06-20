#!/usr/bin/env bats

shopt -s expand_aliases
source ${HOME}/.aliases

@test "Test xclip is available for aliases" {
  run xclip -h
  [[ "$status" -eq 0 ]]
  [[ "$output" =~ "Usage: xclip" ]]
}

@test "Test sudo is available for aliases" {
  run sudo -h
  [[ "$status" -eq 0 ]]
  [[ "$output" =~ "usage: sudo -h" ]]
}
