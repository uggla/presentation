#!/bin/bash

grep some-string /non/existent/file | sort
echo $?
