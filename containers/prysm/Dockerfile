FROM golang:1.23 AS builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o bin/beacon-chain  ./cmd/beacon-chain
RUN go build -o bin/validator     ./cmd/validator

FROM ubuntu:24.04
RUN apt-get update && apt-get install -y curl iproute2 vim

COPY --from=builder /app/bin/beacon-chain /usr/local/bin/beacon-chain
COPY --from=builder /app/bin/validator     /usr/local/bin/validator