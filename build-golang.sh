#!/bin/bash

sudo sysctl net.ipv6.conf.all.disable_ipv6=0

release=$(git describe --abbrev=0 --tags)

docker buildx build --push --no-cache \
	--build-arg RELEASE="1.0.0" \
	-t "aiuni-cn-beijing.cr.volces.com/infra/golang:latest" \
	--platform=linux/amd64 \
	-f Dockerfile.golang .

docker buildx prune -f
sudo sysctl net.ipv6.conf.all.disable_ipv6=0
