#!/bin/bash

./handler.bash &
handler_pid=$!

./generator.sh $handler_pid

wait $handler_pid
