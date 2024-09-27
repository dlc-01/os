#!/bin/bash

 echo "~/lab-3/script1.bash" | at now + 2 minutes


 tail -f ~/report &


 TAIL_PID=$!


 disown $TAIL_PID
