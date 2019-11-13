#!/usr/bin/env bats

@test "Check option usage" {
  run ./myscript.sh -h
  [[ "$status" -eq 1 ]]
  [[ "$output" =~ "usage: myscript" ]]
}

@test "Check no option" {
  run ./myscript.sh
  [[ "$status" -eq 1 ]]
  [[ "$output" =~ "usage: myscript" ]]
}

@test "Check option -o" {
  run ./myscript.sh -o
  [[ "$status" -eq 2 ]]
}

@test "Check normal run" {
  run ./myscript.sh file1
  [[ "$status" -eq 0 ]]
  [[ "$output" =~ "Do stuff" ]]
}
