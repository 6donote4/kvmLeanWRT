#!/bin/bash
mv tools/Makefile tools/Makefile.bak
touch tools/Makefile
mv toolchain/Makefile toolchain/Makefile.bak
touch toolchain/Makefile
exit 0
