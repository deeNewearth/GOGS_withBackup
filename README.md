# GOGS_withBackup
GOGS (https://github.com/gogs/gogs) Works great but the self contained version lack Automated backup.

This image adds CRON based Automated backup to gogs. Which can be then moved to S3.

# Basic Usage

docker run -it  -p 3000:3000   -e CRON_EXPRESSION="54 * * * *"   --name=gogs_with_backup labizbille/gogs_with_backup:latest
