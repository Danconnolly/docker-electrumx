#!/bin/bash

if [[ "$1" == "electrumx_server" ]]; then
	CMD="$1"
	exec "$CMD" 
fi

exec "$@"

