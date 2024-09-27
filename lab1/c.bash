#!/bin/bash

echo "
 --------------------
|     MENU:          |
| 1 - open the VI    |
| 2 - open the NANO  |
| 3 - open the LINKS |
| 4 - exit           |
 --------------------"

read menu

case "$menu" in
  1) vi;;
  2) nano;;
  3) sudo elinks;;
  4) echo 0;;
  *) echo INVALID INPUT;;
esac



