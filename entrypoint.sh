#!/bin/bash

if [[ "$1" == "electrumx_server.py" ]]; then
	CMD="$1"
	shift
	if [[ -s "/run/secrets/bchrpcuser" ]]; then
		BCH_RPC_USER="$(cat /run/secrets/bchrpcuser)"
	fi
	if [[ -s "/run/secrets/bchrpcpassword" ]]; then
		BCH_RPC_PASSWORD="$(cat /run/secrets/bchrpcpassword)"
	fi
	export DAEMON_URL="$BCH_RPC_USER:$BCH_RPC_PASSWORD@$DAEMON_HOST:$DAEMON_PORT"
	exec "$CMD" 
fi

exec "$@"

