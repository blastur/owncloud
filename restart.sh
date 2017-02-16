#!/bin/bash
BASEDIR=$(readlink -f $(dirname "$0"))

PROFILE="${BASEDIR}/$*"

if [[ ! -f "${PROFILE}" ]]; then
	echo "usage: $0 <profile>" >&2
	exit 1
fi

${BASEDIR}/down.sh -v
${BASEDIR}/up.sh ${BASEDIR}/$*
