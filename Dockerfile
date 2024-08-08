FROM debian:latest

RUN apt update

RUN apt purge ^librtlsdr
RUN rm -rvf /usr/lib/librtlsdr* /usr/include/rtl-sdr* /usr/local/lib/librtlsdr* /usr/local/include/rtl-sdr* /usr/local/include/rtl_* /usr/local/bin/rtl_*

RUN apt-get install kmod nginx libncurses-dev libusb-1.0-0-dev git cmake pkg-config -y

RUN git clone https://github.com/rtlsdrblog/rtl-sdr-blog
RUN cd rtl-sdr-blog \
        && mkdir build \
        && cd build \
        && cmake ../ -DINSTALL_UDEV_RULES=ON \
        && make \
        && make install \
        && cp ../rtl-sdr.rules /etc/udev/rules.d/ \
        && ldconfig

RUN echo 'blacklist dvb_usb_rtl28xxu' | tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf

RUN git clone https://github.com/flightaware/dump1090.git /dump1090
WORKDIR /dump1090
RUN git checkout 849a3b73299b4f56620ab16a6b62d88e17f35608
RUN make

# fixes https://github.com/jeanralphaviles/dump1090-docker/issues/2
RUN echo '{"type": "dump1090-docker"}' > /dump1090/public_html/status.json && \
    echo '{"rings": []}' > /dump1090/public_html/upintheair.json

COPY nginx.conf /nginx.conf
COPY mime.types /mime.types
COPY config.js /dump1090/public_html/config.js

RUN cp /dump1090/dump1090 /usr/bin/dump1090

COPY run.sh /run.sh

EXPOSE 8080 30001 30002 30003 30004 30005 30104

ENTRYPOINT ["/run.sh"]