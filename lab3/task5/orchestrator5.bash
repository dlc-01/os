#!/bin/bash

mkfifo pipe

./handler5.bash &
./generator5.bash &

wait

rm pipe
