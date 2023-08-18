FROM golang:1.14-alpine AS development
WORKDIR $GOPATH/src
COPY . .
RUN go build -o golang-demo ./main.go

FROM alpine:latest AS production
WORKDIR /root/
COPY --from=development /go/src/golang-demo .
EXPOSE 9090
ENTRYPOINT ["./golang-demo"]

