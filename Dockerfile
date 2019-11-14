FROM ubuntu:19.04
MAINTAINER haniokasai <htek@haniokasai.com>

ENV DEBIAN_FRONTEND=noninteractive
# installing apt-apps
ADD aptinstaller.sh  /aptinstaller.sh
RUN chmod +x /*.sh & sh /aptinstaller.sh


# other works
## Nothing

# starting SMX
WORKDIR /smx/sys
ENV DOCKER_HOST=/var/run/docker.sock
ENTRYPOINT exec java -Xss200m ENTRYPOINT exec java -Xmx$((i/10*7))m -XX:MaxRAM=`cat /sys/fs/cgroup/memory/memory.limit_in_bytes`-XX:+UseSerialGC -Dspring.profiles.active=production -Dfile.encoding=UTF-8 -Dsmx.testmode=false -jar /smx/sys/smx.jar
