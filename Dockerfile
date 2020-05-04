FROM ros:melodic-ros-core

MAINTAINER Yosuke Matsusaka <yosuke.matsusaka@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y supervisor ros-melodic-turtlesim ros-melodic-turtle-tf && \
    apt-get clean

ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
