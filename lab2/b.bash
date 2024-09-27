#!/bin/bash

ps a -o pid,cmd | grep "$HOME/sbin/" | awk '{print $1}' > sbin_processes.txt