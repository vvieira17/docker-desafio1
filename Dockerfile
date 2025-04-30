
FROM golang:1.20 AS builder

WORKDIR /app

COPY main.go .

RUN go mod init mymodule

RUN go build -o app .

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/app .

CMD ["./app"]

