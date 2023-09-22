FROM golang:1.21-alpine AS builder

RUN apk update
RUN apk add gcc musl-dev libc-dev libusb-dev

COPY quantis/include/* /usr/include/
COPY quantis/bin/EasyQuantis /bin/
COPY quantis/lib64/ /lib/
COPY quantis/lib64/ /lib64/
COPY quantis/lib64/ /lib/x86_64-linux-gnu/

COPY go.mod /go/app/go.mod
COPY main.go /go/app/main.go
COPY utils/utils.go /go/app/utils/utils.go

WORKDIR /go/app/

RUN go build -o ./bin/app

# Runner Container
FROM alpine:3.18

RUN apk update
RUN apk add gcc musl-dev libc-dev libusb-dev

COPY --from=builder /go/app/bin /go/bin

WORKDIR /go/bin/
ENTRYPOINT /go/bin/app