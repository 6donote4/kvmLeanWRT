#!/bin/bash
make $1 -j$(($(nproc)+1)) V=s |tee compile.log
exit 0
