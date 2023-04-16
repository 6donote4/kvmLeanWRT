#!/bin/bash
make $1/clean -j1 V=sc
make $1/compile -j1 V=sc | tee compile.log
exit 0
