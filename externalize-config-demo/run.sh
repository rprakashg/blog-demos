#!/usr/bin/env bash

docker run -d -p 80:8080 -e PROFILE=production rprakashg/externalize-config-demo .