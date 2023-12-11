FROM golang:1.21.5-alpine3.19

WORKDIR /app

RUN apk update && \
    apk add --update gcc

COPY go.mod go.sum ./
RUN go mod download

COPY main.go .

RUN go build -o /app/main .