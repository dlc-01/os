#!/bin/bash


if [[ $PWD == $HOME ]]
then
  echo "$HOME"
  exit 0
else
  echo "No home"
  exit 1
fi