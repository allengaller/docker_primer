# Develop Go application on Beego Framework
# version 1.0

FROM cloudcube/beego

MAINTAINER HipinZhao "cloudcube@outlook.com"

ENV REFRESHED_AT 2015-2-9 20:56

USER root

RUN apt-get update  

RUN apt-get install git openssh-server vim ssh telnet zsh tmux libc6 -y

RUN echo "export LC_ALL=C" >> /root/.bashrc

RUN chsh -s /usr/bin/zsh

# Install Supervisor.
RUN \
   apt-get install -y supervisor && \
     sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

ADD adds/authorized_keys /authorized_keys

ADD config/config.sh /config.sh

RUN chmod u+x /config.sh

RUN sh /config.sh && rm /config.sh

ADD config/sshd.conf /etc/supervisor/conf.d/sshd.conf

RUN mkdir /root/repos -p

WORKDIR /root/repos

# Clone Develop Tool Vim for golang
RUN git clone https://github.com/haibinpark/gorc.git devrc

WORKDIR /root/repos/devrc

RUN git checkout -b golang origin/golang

RUN git submodule update --init --recursive

RUN git submodule foreach git pull origin master

# Install go plugin
WORKDIR /gopath

# RUN mkdir tools/go -p

ENV GOPATH /gopath:$GOPATH

RUN go get -u github.com/jstemmer/gotags

RUN go get -u github.com/nsf/gocode

RUN go get -u code.google.com/p/rog-go/exp/cmd/godef

RUN go get -u code.google.com/p/go.tools/cmd/goimports

# Add proj tmpl files

RUN mkdir /beego-dev/tmp -p

ADD projtmpl/env.sh /beego-dev/tmp/env.sh

ADD projtmpl/link.sh /beego-dev/tmp/link.sh

# Add run script 
#
ENV PATH /root/.bin:$PATH

ADD run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run

RUN mkdir -p /root/projs

VOLUME ["/root/projs"]

WORKDIR /root/projs

EXPOSE 22 8080

CMD ["/bin/zsh","/usr/local/bin/run"]
