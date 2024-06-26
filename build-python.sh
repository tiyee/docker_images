#!/bin/bash

sudo sysctl net.ipv6.conf.all.disable_ipv6=0

release=$(git describe --abbrev=0 --tags)

docker buildx build --push --no-cache \
	--build-arg RELEASE="1.0.0" \
	-t "registry-vpc.cn-hongkong.aliyuncs.com/aiuni/python:3.10" \
	--platform=linux/amd64 \
	-f Dockerfile.python .

docker buildx prune -f
sudo sysctl net.ipv6.conf.all.disable_ipv6=0
