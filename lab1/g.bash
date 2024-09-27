#!/bin/bash

regex="[[:alnum:]._%+-]\+@[[:alnum:].-]\+\.[[:alpha:]]\{2,\}"
grep -rohs "$regex" /etc/* | uniq |tr '\n' ',' | sed 's/,$/\n/'   > emails.list