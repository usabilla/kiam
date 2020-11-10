FROM 644152709166.dkr.ecr.eu-west-1.amazonaws.com/usabilla/dev/dockerhub-mirror/golang:1.10-alpine3.8 as build
RUN apk add --no-cache make
WORKDIR /go/src/github.com/uswitch/kiam
ADD . .
RUN make bin/kiam-linux-amd64

FROM 644152709166.dkr.ecr.eu-west-1.amazonaws.com/usabilla/dev/dockerhub-mirror/alpine:3.8
RUN apk --no-cache add iptables
COPY --from=build /go/src/github.com/uswitch/kiam/bin/kiam-linux-amd64 /kiam
CMD []
