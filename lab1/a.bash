#!/bin/bash

max="$1"
numb="$@"
for tmp in "${@:1:3}"; do
  if ((tmp > max)); then
    max="$tmp"
  fi
done
printf '%d\n' "$max"