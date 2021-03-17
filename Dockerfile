FROM golang:1.9-alpine as builder
COPY main.go /go
RUN go build -o /go/main /go/main.go



FROM alpine as prod
MAINTAINER pch18.cn

COPY --from=0 /go/main /main
RUN apk add v2ray --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

ADD config.json /etc/v2ray/config.json.tmp


ENV PATH_RAY /_ray
ENV PATH_DOC /_doc
ENV URL_DISGUISE https://agar.io

ENV ALTER_ID 64
ENV UUID_default 00000000-0000-0000-0000-000000000000

EXPOSE 80
CMD ./main
