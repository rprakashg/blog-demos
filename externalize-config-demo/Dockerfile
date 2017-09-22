FROM maven:3.5-jdk-8 as builder

WORKDIR /projects/java/externalize-config-demo

COPY . /projects/java/externalize-config-demo

RUN mvn clean install -DskipTests

FROM openjdk:alpine

VOLUME /tmp

COPY entrypoint.sh /

COPY --from=builder /projects/java/externalize-config-demo/target/*.jar app.jar

RUN apk add --update bash jq wget && rm -rf /var/cache/apk/* \
    && bash -c 'touch /app.jar' \
    && chmod 700 /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD ["start"]