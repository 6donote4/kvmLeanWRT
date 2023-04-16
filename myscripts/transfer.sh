#!/bin/bash
tar -jcvf - dl/ |ssh user@192.168.2.1 "dd of=/home/user/dl.tbz2"
tar cvjf - ./ |ssh user@192.168.2.1 "cat > /home/user/openwrt/vmOpenWrt_R20_5_9.tbz2"
