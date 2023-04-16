#!/bin/bash
gzip -dc *.gz |sudo dd of=/dev/vdc
exit 0
