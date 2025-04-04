FROM golang:1.23 AS builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go run build/ci.go install -static ./cmd/geth

FROM ubuntu:24.04

RUN apt-get update && apt-get install -y curl iproute2 vim

WORKDIR /app
COPY --from=builder /app/build/bin/geth /usr/local/bin/geth

ENTRYPOINT ["geth"]