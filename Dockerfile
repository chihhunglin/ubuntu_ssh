FROM ubuntu:14.10
MAINTAINER  Paddy Lin <dragon270329@gmail.com>

# Setup Environment
ENV DEBIAN_FRONTEND noninteractive

# Install
RUN apt-get update && \ 
    apt-get -y install curl bash-completion vim-tiny supervisor wget openssh-server

# Setup root password for login process
RUN echo root:root | chpasswd

# Setup sshd environement
RUN mkdir -p /var/run/sshd
RUN chmod 755 /var/run/sshd

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# Language setup
RUN locale-gen zh_TW zh_TW.UTF-8 en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

# Common alias
RUN alias ls='ls --color=auto'
RUN alias ll='ls -halF'

# supervisor setup
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22

CMD ["/usr/bin/supervisord"]
