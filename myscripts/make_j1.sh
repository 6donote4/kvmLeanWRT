#!/bin/bash
#OPENWRT_BUILD = 0(first compile) 1(second compile)
#export OPENWRT_BUILD=1
make -j1 V=sc |tee compile.log
#TRY=0
#SUCCESS=1
#while [ $SUCCESS -eq 1 ]
#do
#if [[ $(grep -F "ERROR:" error.log|awk '{print $1}') == "ERROR:" ]]; then
#TRY=`expr $TRY + 1`
#DEBUG=$(grep -F "ERROR: " error.log|awk '{print $2}')
#make -j1 V=sc $DEBUG/clean
#make -j1 V=sc $DEBUG/compile
#echo $TRY
#if [[ $TRY -eq 2 ]]; then
#    SUCCESS=0
#    exit 1
#fi
#else
#make -j1 V=sc > error.log  && tail -20 error.log > error.log
#fi
#if [[ $(grep -F "ERROR:" error.log|awk '{print $1}') != "ERROR:" ]]; then
#    break
#fi
#done
echo $OPENWRT_BUILD
exit 0
