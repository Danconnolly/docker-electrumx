FROM python:3.6.6-jessie

ARG ELECTRUMX_VERSION=f7371e7a71c90017d4dd60be6272dc868bcbf672

RUN apt-get update && \
    apt-get install libleveldb-dev -y && \
    pip install git+git://github.com/kyuupichan/electrumx.git@${ELECTRUMX_VERSION} && \
    useradd electrumx && \
    mkdir /srv/db && \
    chown electrumx:electrumx /srv/db

COPY entrypoint.sh /entrypoint.sh
COPY motd /srv/motd

ENV COIN=BitcoinSV
ENV DB_DIRECTORY=/srv/db
ENV DAEMON_HOST=localhost
ENV DAEMON_PORT=8333
ENV TCP_PORT=50001
ENV SSL_PORT=50002
ENV SSL_CERTFILE=/srv/server.crt
ENV SSL_KEYFILE=/srv/server.key
ENV DONATION_ADDRESS=none
ENV BANNER_FILE=/srv/motd
ENV HOST=""

USER electrumx
VOLUME /srv/db
EXPOSE 50001 50002 51001 51002
CMD ["electrumx_server"]
ENTRYPOINT ["/entrypoint.sh"]

