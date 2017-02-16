#!/bin/bash
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(cd ${SCRIPTDIR} && exec ${SCRIPTDIR}/docker-compose down $*)

