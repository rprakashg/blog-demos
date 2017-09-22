#!/usr/bin/env bash

docker run -d -p 80:8080 -e PROFILE=production -e GIT_REPO="https://github.com/rprakashg/blog-demos" \
    -e LABEL=master -e PATH="/blob/master/externalize-config-demo/configuration/" \
    -e APP_NAME="application" rprakashg/externalize-config-demo .