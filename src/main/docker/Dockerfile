FROM ubuntu:17.10

RUN apt-get update -qq
RUN apt-get upgrade -yqq
RUN apt-get -yqq install varnish
RUN apt-get -yqq clean

ENV VARNISH_PORT 8085
EXPOSE 8085

RUN mkdir -p /opt/senizm/bin
ADD bin /opt/senizm/bin
RUN chmod 0555 /opt/senizm/bin/entrypoint.sh

WORKDIR /opt/senizm/bin

RUN useradd -ms /bin/bash senizm

RUN chown -R senizm:senizm /etc/varnish/ && \
    chown senizm:senizm /var/lib/varnish/ && \
    usermod -a -G senizm varnishlog

USER senizm

CMD ["/opt/senizm/bin/entrypoint.sh"]