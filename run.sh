#!/bin/bash
i=(`awk '/^Mem/ {printf("%u", $7);}' <(free -m)`)
exec java -Xms200m -Xmx$((i/10*7))m -XX:MaxRAM=`cat /sys/fs/cgroup/memory/memory.limit_in_bytes` -XX:+UseSerialGC -Dspring.profiles.active=production  -Dfile.encoding=UTF-8 -Dsmx.testmode=false -jar /smx/sys/smx.jar
