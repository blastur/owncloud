#!/bin/bash

PROFILE=${1:-}

if [ -z "${PROFILE}" ]; then
	echo "usage: $0 <profile>" >&2
	exit 1
fi

shift

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROFILEDIR=$(readlink -f $(dirname ${PROFILE}))

if [ ! -f "${PROFILE}" ]; then
    echo "error: invalid profile ${PROFILE}" >&2
    exit 1
fi
source ${PROFILE}

export PROFILE_SSLCERT="${PROFILEDIR}/cert.pem"
export PROFILE_SSLKEY="${PROFILEDIR}/key.pem"
export PROFILE_DATADIR="${PROFILEDIR}/owncloud-data"
export PROFILE_CFGDIR="${PROFILEDIR}/owncloud-cfg"
export PROFILE_APPDIR="${PROFILEDIR}/owncloud-apps"
export PROFILE_DBDIR="${PROFILEDIR}/owncloud-db"

if [ ! -f "${PROFILE_SSLCERT}" -o ! -f "${PROFILE_SSLKEY}" ]; then
    echo "error: no certfile in profile ${PROFILE}" >&2
    echo "Please make sure ${PROFILE_SSLCERT} and ${PROFILE_SSLKEY} exists)" >&2
    exit 1
fi

#mkdir -p "${PROFILE_DATADIR}"
#mkdir -p "${PROFILE_DBDIR}"
#mkdir -p "${PROFILE_CFGDIR}"
#mkdir -p "${PROFILE_APPDIR}"

(cd ${SCRIPTDIR} && exec docker-compose up -d $*)
