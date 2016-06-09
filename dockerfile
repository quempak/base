FROM phusion/baseimage
ENV DEBIAN_FRONTEND noninteractive
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*
RUN apt-get update && apt-get install nginx php5-fpm mysql-server vim telnet language-pack-de-base git ssmtp wget mysql-client
RUN echo "export TERM=linux" | tee -a /root/.bashrc /etc/bash.bashrc
RUN echo "Host *\nStrictHostKeyChecking no\nUserKnownHostsFile=/dev/null">>/root/.ssh/config
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN locale-gen de_DE.UTF-8
RUN export LANG=de_DE.UTF-8
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*
CMD ["/sbin/my_init"]
VOLUME /share
