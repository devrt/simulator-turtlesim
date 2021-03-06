FROM ros:melodic-ros-core

MAINTAINER Yosuke Matsusaka <yosuke.matsusaka@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y python-pip ros-melodic-turtlesim ros-melodic-turtle-tf && \
    pip install -U --no-cache-dir supervisor supervisor_twiddler && \
    apt-get clean

ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/local/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
