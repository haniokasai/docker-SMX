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
ENTRYPOINT java -Xss200m -XX:MaxRAM=2000m -XX:+UseSerialGC -Dspring.profiles.active=production -Dfile.encoding=UTF-8 -Dsmx.testmode=true -jar /smx/sys/smx.jar
