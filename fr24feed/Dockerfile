FROM debian:latest

ENV FR24FEED_AMD64_VERSION=1.0.44-0
ENV FR24FEED_ARMHF_VERSION=1.0.44-0
ENV RECEIVER_HOST=dump1090
ENV RECEIVER_PORT=30005

RUN apt update
RUN apt install wget tar gettext -y

COPY install.sh /install.sh
RUN /install.sh

COPY run.sh /run.sh
COPY fr24feed.ini.tpl /etc

EXPOSE 8754

ENTRYPOINT ["/run.sh"]