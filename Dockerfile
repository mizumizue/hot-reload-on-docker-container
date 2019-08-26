# Builder container
ARG GO_VERSION
ARG PROJECT_NAME

FROM golang:${GO_VERSION}-alpine as build

ENV GO111MODULE=on

WORKDIR /go/src/${PROJECT_NAME}
ADD . /go/src/${PROJECT_NAME}

RUN apk add --no-cache git
RUN go build -o app
RUN go get github.com/oxequa/realize

# Application container
FROM alpine:latest

WORKDIR /approot
COPY --from=build /go/src/${PROJECT_NAME}/app .

RUN addgroup go \
RUN adduser -D -G go go \
RUN chown -R go:go /approot/app

CMD ["./app"]
