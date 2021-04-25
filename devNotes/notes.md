https://github.com/gogs/gogs/issues/4339

Backup:

docker exec -it <container_id> bash
cd ..
USER=git ./gogs backup
exit
docker cp <container_id>:/app/gogs/<backup_name> .
Restore:
Note: cross-device-link is caused by move between 2 mount so the solution is to use tmp folder in the same mount as data where gogs reside which is /data by default for docker gogs.

docker cp <backup_name> <container_id>:/data/
docker exec -it <container_id> bash
mkdir /data/tmp
cd /data
USER=git /app/gogs/gogs restore --from="<backup_name>" -t /data/tmp



**ideas for new job**
https://techsparx.com/software-development/docker/damp/docker-cron.html
Creating a Docker container to run both Cron and NGINX

**current steps**
docker build -t testbuild .
docker run -it  -p 3000:3000   -e CRON_EXPRESSION="54 * * * *"   --name=test1   testbuild

docker cp gogs-backup-20210425012436.zip test1:/gogs-backup-20210425012436.zip
docker exec -it test1 bash

mkdir /data/tmp
cd /data
USER=git /app/gogs/gogs restore --from="/gogs-backup-20210425012436.zip" -t /data/tmp
exit

docker stop test1
docker start test1
docker exec -it test1 bash

USER=git /app/gogs/gogs backup --archive-name=/backupdata/mycool.archi.zip

docker logs test1 -f

docker stop test1
docker rm test1


cat /data/gogs/conf/app.ini

mikesir87/aws-cli@sha256:064523bff733063ccabe2110314c534a4c6a0ad79ee3488e536a6c5de37c6835