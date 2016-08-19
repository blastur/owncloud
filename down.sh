#!/bin/bash
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(cd ${SCRIPTDIR} && exec docker-compose down $*)

