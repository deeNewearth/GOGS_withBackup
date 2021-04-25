FROM gogs/gogs:0.12


WORKDIR /

COPY . .

RUN chmod +x *.sh

ENV CRON_EXPRESSION="0 */6 * * *"

ENTRYPOINT ["/entry.sh"]


