#!/bin/bash

str=""
tmp=""
while [[ "$tmp" != "q" ]] ;do
  str="$str$tmp"
  read tmp
done;

echo "$str"