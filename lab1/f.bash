#!/bin/bash
awk '$3 == "install" {print $1, $2, "STARTING", $4}  $3 == "status" && $4 == "installed"{print $1, $2, "FINISHED", $5}' /var/log/dpkg.log > install.log