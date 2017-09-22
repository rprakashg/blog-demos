#!/usr/bin/env bash

echo "Downloading configuration files from git repository"
wget  $GIT_REPO/$LABEL/$PATH/$APP_NAME.json
wget  $GIT_REPO/$LABEL/$PATH/$APP_NAME-$PROFILE.json

cp $APP_NAME.json ./configs/$APP_NAME.json
cp $APP_NAME-$PROFILE.json ./configs/$APP_NAME-$PROFILE.json

CMD=$1
echo "Command :" $CMD

JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses -Duser.timezone=America/Los_Angeles -Dhttps.protocols=TLSv1.1,TLSv1.2 -Djava.security.egd=file:/dev/./urandom"

echo $JAVA_OPTS

case "$CMD" in
    "start")
        echo "Starting SpringBoot application"
        exec java $JAVA_OPTS -jar /app.jar --spring.config.location="./configs/$APP_NAME.yml, ./configs/$APP_NAME-$PROFILE.yml"
    ;;

    * )
    # custom command
    exec $CMD ${@:2}
    ;;
esac