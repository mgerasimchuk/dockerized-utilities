FROM golang:1.17.3-alpine3.15

ENV CGO_ENABLED 0
ENV GO111MODULE on

RUN apk add --no-cache git make bash curl vim nano jq openssl


# buf
RUN BIN="/usr/local/bin" && \
    VERSION="1.0.0-rc10" && \
    BINARY_NAME="buf" && \
      curl -sSL \
        "https://github.com/bufbuild/buf/releases/download/v${VERSION}/${BINARY_NAME}-$(uname -s)-$(uname -m)" \
        -o "${BIN}/${BINARY_NAME}" && \
      chmod +x "${BIN}/${BINARY_NAME}"
RUN cd /go/src/ && go get github.com/go-delve/delve/cmd/dlv@v1.7.3 &&\
    go get github.com/cespare/reflex@v0.3.1  &&\
    go get github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway  &&\
    go get github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2  &&\
    go get google.golang.org/protobuf/cmd/protoc-gen-go  &&\
    go get google.golang.org/grpc/cmd/protoc-gen-go-grpc

# generate-jwt-token.sh
COPY files /

WORKDIR /app

ENTRYPOINT ["/bin/bash"]
