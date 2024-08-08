#!/bin/sh
set -e

envsubst < /etc/fr24feed.ini.tpl > /etc/fr24feed.ini
/fr24feed/fr24feed_amd64/fr24feed --fr24key=${FR24FEED_FR24KEY}