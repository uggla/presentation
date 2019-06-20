#!/bin/bash

# Synchornize fses
# Use this script to migrate fs data to a remote server
# Parameters:
# $1: remote server
# $2: src fs name
# $3: dst fs name
#
# Example to copy all data fses to rmt_server:
# for i in $(mount | grep data | awk '{print $3}')
# do
#   pitfall1.sh $i rmt_server:$i
# done

RSERVER=$1
SRC=$2
DST=$3

echo "Synchronize $SRC to $RSERVER..."
rsync -avx --progress --delete /"$SRC" "$RSERVER":/"$DST"
