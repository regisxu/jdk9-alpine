FROM alpine:3.6

MAINTAINER Regis Xu <xu.regis@gmail.com>

ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:/usr/lib/jvm/default-jvm/bin/

RUN mkdir -p /usr/lib/jvm/ && \
    apk update && apk upgrade && apk add --no-cache curl && \
    curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.java.net/java/jdk9-alpine/archive/171/binaries/jdk-9-ea+171_linux-x64-musl_bin.tar.gz" | tar xz -C /usr/lib/jvm && \
    ln -s jdk-9 /usr/lib/jvm/default-jvm && \
    apk del curl
