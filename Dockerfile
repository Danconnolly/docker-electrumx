FROM python:3.10-buster

ARG ELECTRUMX_VERSION=1.20.2

RUN apt-get update && \
    apt-get install libleveldb-dev -y && \
    pip install aiohttp pylru aiorpcX plyvel && \
    pip install git+https://github.com/kyuupichan/electrumx.git@${ELECTRUMX_VERSION} && \
    useradd electrumx && \
    mkdir /srv/db && \
    chown electrumx:electrumx /srv/db

COPY entrypoint.sh /entrypoint.sh
COPY motd /srv/motd

ENV COIN=BitcoinSV
ENV DB_DIRECTORY=/srv/db
ENV DAEMON_URL=http://username:password@localhost:8332/
ENV SSL_CERTFILE=/srv/server.crt
ENV SSL_KEYFILE=/srv/server.key
ENV DONATION_ADDRESS=none
ENV BANNER_FILE=/srv/motd

USER electrumx
VOLUME /srv/db
EXPOSE 50001 50002 51001 51002
CMD ["electrumx_server"]
ENTRYPOINT ["/entrypoint.sh"]

