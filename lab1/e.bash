#!/bin/bash

awk '$3 == "status"' /var/log/dpkg.log > info.log