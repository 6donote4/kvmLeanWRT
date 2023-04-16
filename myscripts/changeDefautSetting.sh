#!/bin/bash
DESTINATION="package/base-files/files/bin/config_generate"
cat $DESTINATION | sed -e 's/192.168.1.1/192.168.9.1/g' > config_generate
mv config_generate $DESTINATION
exit 0

