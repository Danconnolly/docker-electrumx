# docker-electrumx

A docker container for [Electrum X](https://electrumx.readthedocs.io/en/latest/).

The container is available at [docker hub](https://hub.docker.com/repository/docker/dconnolly/electrumx/general). The
repository for this docker file is [here](https://github.com/Danconnolly/docker-electrumx). 

The container is preconfigured for [Bitcoin SV](https://www.bitcoinsv.io/). Other blockchains may work but are not supported.

Suggestions are welcomed, please use the [Github issues](https://github.com/Danconnolly/docker-electrumx/issues).

## Bitcoin Node Requirements
Electrum X relies on a Bitcoin node to query the state of the blockchain. The node must be configured:
* to index all transactions (option `txindex=1` in the configuration file)
* to expose the REST interface (option 'rest=1' in the configuration file)

Electrum X will need access to the RPC interface.

## Configuration
The majority of the configuration is controlled by environment variables. The following environment variables
are mandatory:
* DAEMON_URL - connection string for the BSV node - following the format `http://username:password@host:port/`

Other environemnt variables have defaults:

| Variable | Default | Purpose |
| -------- | ------- | ------- |
|COIN | BitcoinSV | The Bitcoin variant to use |
|SSL_CERTFILE | /src/server.crt | the certificate for SSL connections |
| SSL_KEYFILE | /srv/server.key | the private key for the certificate for SSL connections | 
| DONATION_ADDRESS | none | Bitcoin address for donations |
| BANNER_FILE | /srv/motd | The banner to send to clients |

## Storage
Electrum X needs persistent storage. In the example docker-compose.yml a storage volume is declared and configured.

## Running in Docker
To run the Electrum X server using the default settings, use a command such as:
`docker-compose -f ./docker-compose.yml up`

Note that using 'localhost' as your hostname will not work as this will resolve to the container itself.

