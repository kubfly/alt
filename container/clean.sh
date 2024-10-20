#!/bin/bash

set -e

source $1

echo
echo "------- [PRUNE IMAGE]: $GROUP/$APPLICATION:$VERSION-$REVISION -------"
echo
podman manifest rm $GROUP/$APPLICATION:$VERSION-$REVISION
podman image prune --force\
                   --filter label=group="$GROUP"\
                   --filter label=application="$APPLICATION"\
                   --filter label=version="$VERSION"\
                   --filter label=revision="$REVISION"
