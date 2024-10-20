#!/bin/bash

set -e

/bin/update-ca-trust

if [[ $# != 0 ]]; then
  exec $@
fi
