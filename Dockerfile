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
ADD run.sh  /run.sh
ENTRYPOINT bash /run.sh