#!/bin/bash
names=(
  "Bruce Wayne"
  "Peter Parker"
  "Lucifer Morning Star"
  "Clark Kent"
)

echo "With default IFS value..."
for name in ${names[@]}; do
  echo "$name"
done

echo ""
echo "With strict-mode IFS value..."
IFS=$'\n\t'
for name in ${names[@]}; do
  echo "$name"
done
