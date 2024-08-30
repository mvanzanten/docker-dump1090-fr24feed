#!/bin/sh
arch=$(dpkg --print-architecture)
case $arch in
  arm64)
    url=https://repo-feed.flightradar24.com/rpi_binaries/fr24feed_${FR24FEED_ARMHF_VERSION}_armhf.tgz # force version 1.0.25-3 because of broken version for rpi
    dirname=fr24feed_armhf
    ;;
  amd64)
    url=https://repo-feed.flightradar24.com/linux_binaries/fr24feed_${FR24FEED_AMD64_VERSION}_amd64.tgz
    dirname=fr24feed_amd64
    ;;
  *)
    exit 1
    ;;
esac

mkdir /.fr24feed
wget -O /.fr24feed/fr24feed.tgz $url
cd /.fr24feed
tar -xzf fr24feed.tgz
mv -f $dirname /fr24feed
rm /.fr24feed
chmod -R +x /fr24feed