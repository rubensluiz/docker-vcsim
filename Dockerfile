FROM golang:1.13.4-alpine3.10 AS builder

RUN apk --no-cache add git && \
    go get -u github.com/vmware/govmomi/vcsim

FROM alpine:3.10

EXPOSE 8989
COPY --from=builder /go/bin/vcsim /
ENTRYPOINT ["/vcsim","-l",":8989"]
