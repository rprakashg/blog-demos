#!/usr/bin/env bash

docker run -d -p 80:8080 -e PROFILE=staging -e GIT_REPO="https://raw.githubusercontent.com/rprakashg/blog-demos" \
    -e LABEL=master -e REL_PATH="externalize-config-demo/src/main/resources" \
    -e APP_NAME="application" rprakashg/externalize-config-demo
