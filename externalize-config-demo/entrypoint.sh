#!/usr/bin/env bash

echo "Downloading config.json from git repository"

wget -O externalizeconfigdemo.json $GIT_REPO/$LABEL/$PATH/$APP.json

JSON=""

case $PROFILE in
    "production")
    echo "Downloading production config"
    wget -O externalizeconfigdemo.json $GIT_REPO/$LABEL/$PATH/$APP-production.json
    echo "Merging configs"
    ;;

    "staging")
    echo "Downloading staging config"
    wget -O externalizeconfigdemo.json $GIT_REPO/$LABEL/$PATH/$APP-staging.json
    echo "Merging configs"

    ;;

    "development")
    wget -O externalizeconfigdemo.json $GIT_REPO/$LABEL/$PATH/$APP-development.json
    echo "Merging configs"

    ;;
esac

CMD=$1
echo "Command :" $CMD

PROPS=""

JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses -Duser.timezone=America/Los_Angeles -Dhttps.protocols=TLSv1.1,TLSv1.2 -Djava.security.egd=file:/dev/./urandom"

echo $JAVA_OPTS

case "$CMD" in
    "start")
        echo "Starting SpringBoot application"
        exec java $JAVA_OPTS -jar /app.jar --spring.application.json=$JSON
    ;;

    * )
    # custom command
    exec $CMD ${@:2}
    ;;
esac