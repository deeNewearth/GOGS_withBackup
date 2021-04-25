#!/bin/sh
echo "using cron Expression $CRON_EXPRESSION"

echo "$CRON_EXPRESSION /backup.sh" >> crontab.tmp
crontab crontab.tmp
rm -rf crontab.tmp

# start cron
/usr/sbin/crond -f -l 2 &

echo Starting GOGS

/app/gogs/docker/start.sh /bin/s6-svscan /app/gogs/docker/s6/