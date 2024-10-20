#!/bin/bash

set -e

echo "Cleaning apt..."
apt-get clean
rm -rf /var/lib/apt/*
rm -rf /var/cache/apt/*
mkdir -p /var/lib/apt/lists/partial
mkdir -p /var/cache/apt/archives/partial
