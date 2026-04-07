from docker.io/library/maven as builder

RUN mkdir /deps
COPY ./pom.xml /deps/
RUN mvn -f /deps/pom.xml dependency:copy-dependencies -DoutputDirectory=/deps/target

from docker.io/apache/activemq-artemis:latest-alpine

COPY --from=builder /deps/target/ /opt/activemq-artemis/lib/