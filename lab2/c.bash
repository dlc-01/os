ps a -o pid,lstart | tail -n 1 | awk '{print $1}'