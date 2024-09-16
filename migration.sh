#!/usr/bin/env bash

export ONCE=true
export TLS_TOFU=true

export SRC_REPO=$1
export SRC_REPO_TOKEN=
export SRC_REPO_TOKEN_USER=

export DST_REPO=$2
export DST_REPO_TOKEN=
export DST_REPO_TOKEN_USER=

docker run \
  --rm \
  --env SRC_REPO=${SRC_REPO} \
  --env DST_REPO=${DST_REPO} \
  --env SLEEP_TIME=30s \
  olegbukatchuk/tls-tofu:1.0.0