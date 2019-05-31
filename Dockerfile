FROM golang:1.12.5-alpine3.9 AS builder

RUN apk --no-cache add git && \
    go get -u github.com/vmware/govmomi/vcsim

FROM alpine:3.9

EXPOSE 8989
COPY --from=builder /go/bin/vcsim /
ENTRYPOINT ["/vcsim","-l",":8989"]
