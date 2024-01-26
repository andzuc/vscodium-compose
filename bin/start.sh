#!/bin/bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export BASEDIR="${MYDIR}/.."
cd "${BASSEDIR}"

source .env
if ! docker volume inspect "${VSCODIUM_CONFIG}" >/dev/null 2>&1 ; then
    echo docker volume create "${VSCODIUM_CONFIG}"
    docker volume create "${VSCODIUM_CONFIG}"
fi
docker volume inspect "${VSCODIUM_CONFIG}"

docker compose up -d
echo "Open vscodium URL: http://localhost:${KASMVNC_PORT}"
echo "Or use host X11 server: docker exec -e DISPLAY -it vscodium su abc -c codium"
