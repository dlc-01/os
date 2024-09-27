#!/bin/bash

./cycle.bash & PID1=$!

./cycle.bash & PID2=$!

./cycle.bash & PID3=$!

CPULIMIT_PID=$!
sudo cpulimit -p $PID1 -l 10 &


sleep 5

kill -SIGTERM $PID3

disown $CPULIMIT_PID
