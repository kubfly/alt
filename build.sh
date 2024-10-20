#!/bin/bash

set -e

export BUILD="$(date -u +"%Y-%m-%d %H:%M:%S")"

container/build.sh meta/alt.meta container/alt.cf
