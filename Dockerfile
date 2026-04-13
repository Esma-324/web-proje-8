# Aşama 1: Derleme
FROM golang:1.23-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=1 go build -o golearn .

# Aşama 2: Çalıştırma (minimal image)
FROM alpine:latest
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY --from=builder /app/golearn .
EXPOSE 8090
CMD ["./golearn"]
