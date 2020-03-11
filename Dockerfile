FROM golang:1.13 as build-env

WORKDIR /go/src/app
ADD . /go/src/app

RUN CGO_ENABLED=0 GO111MODULE=on go build -mod=vendor -o /go/bin/configmapsecret-controller /go/src/app/cmd/configmapsecret-controller

FROM gcr.io/distroless/static:latest
COPY --from=build-env /go/bin/configmapsecret-controller /
CMD ["/configmapsecret-controller"]
