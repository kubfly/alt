#!/bin/bash

set -e

source $1

echo
echo "------- [BUILD IMAGE]: $GROUP/$APPLICATION:$VERSION-$REVISION -------"
echo
podman manifest create $GROUP/$APPLICATION:$VERSION-$REVISION
podman build --no-cache --file $2 --os linux --arch amd64\
                        --build-arg REGISTRY_ALT="$REGISTRY_ALT"\
                        --build-arg GROUP="$GROUP"\
                        --build-arg APPLICATION="$APPLICATION"\
                        --build-arg VERSION="$VERSION"\
                        --build-arg REVISION="$REVISION"\
                        --build-arg DESCRIPTION="$DESCRIPTION"\
                        --build-arg LICENSE="$LICENSE"\
                        --build-arg WEB="$WEB"\
                        --build-arg REPOSITORY="$REPOSITORY"\
                        --build-arg BUILD="$BUILD"\
                        --manifest $GROUP/$APPLICATION:$VERSION-$REVISION .
podman build --no-cache --file $2 --os linux --arch arm64 --variant v8\
                        --build-arg REGISTRY_ALT="$REGISTRY_ALT"\
                        --build-arg GROUP="$GROUP"\
                        --build-arg APPLICATION="$APPLICATION"\
                        --build-arg VERSION="$VERSION"\
                        --build-arg REVISION="$REVISION"\
                        --build-arg DESCRIPTION="$DESCRIPTION"\
                        --build-arg LICENSE="$LICENSE"\
                        --build-arg WEB="$WEB"\
                        --build-arg REPOSITORY="$REPOSITORY"\
                        --build-arg BUILD="$BUILD"\
                        --manifest $GROUP/$APPLICATION:$VERSION-$REVISION .
