FROM golang:1.12-alpine

LABEL maintainer="githubtestingacct@gmail.com"

WORKDIR $GOPATH/src/github.com/testaccount-cb/whatismyip-go
COPY . .

RUN go get -d -v ./...

RUN go install -v ./... && \
  CGO_ENABLED=0 GOOS=linux go test -c

EXPOSE 8000

ENV WHATISMYIP_PORT 8000

USER nobody:nobody

CMD ["whatismyip-go"]
