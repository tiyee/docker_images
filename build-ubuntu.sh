#!/bin/bash

sudo sysctl net.ipv6.conf.all.disable_ipv6=0
echo -n "Enter your register:"
read  registy
echo "your register $registy"
release=$(git describe --abbrev=0 --tags)

docker buildx build --push --no-cache \
	--build-arg RELEASE="1.0.0" \
	-t "${registy}" \
	--platform=linux/amd64 \
	-f Dockerfile.python .

docker buildx prune -f
sudo sysctl net.ipv6.conf.all.disable_ipv6=0
