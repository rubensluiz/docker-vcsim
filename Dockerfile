FROM golang:1.14.2-alpine3.11 AS builder

RUN apk --no-cache add git && \
    go get -u github.com/vmware/govmomi/vcsim

FROM alpine:3.11.5

EXPOSE 8989
COPY --from=builder /go/bin/vcsim /
ENTRYPOINT ["/vcsim","-l",":8989"]
