FROM debian:latest

ENV FR24FEED_AMD64_VERSION=1.0.44-0
ENV RECEIVER_HOST=dump1090
ENV RECEIVER_PORT=30005

RUN apt update
RUN apt install wget tar gettext -y

RUN mkdir /fr24feed \
        && wget -O /fr24feed/fr24feed.tgz https://repo-feed.flightradar24.com/linux_binaries/fr24feed_${FR24FEED_AMD64_VERSION}_amd64.tgz \
        && cd /fr24feed \
        && tar -xzf fr24feed.tgz \
        && rm /fr24feed/fr24feed.tgz \
        && chmod +x /fr24feed

COPY run.sh /run.sh
COPY fr24feed.ini.tpl /etc

EXPOSE 8754

ENTRYPOINT ["/run.sh"]