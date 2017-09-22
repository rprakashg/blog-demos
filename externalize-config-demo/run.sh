#!/usr/bin/env bash

docker run -d -p 80:8080 -e PROFILE=production -e GIT_REPO= -e LABEL=master -e PATH="" \
    -e APP_NAME="application" rprakashg/externalize-config-demo .