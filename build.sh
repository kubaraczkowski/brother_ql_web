#!/bin/bash

set -e -x

PREFIX=europe-west1-docker.pkg.dev/spec-main-prod/spty-docker

DOCKER_BUILDKIT=1 docker buildx build \
    --platform linux/amd64 \
    -t ${PREFIX}/brother_ql_web:latest \
    . \
    --push