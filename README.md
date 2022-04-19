# dockerized-utilities

## alpine3.15-golang-1.17.3

utils in image:
- go
- buf
- curl
- [mockgen v1.6.0](https://github.com/golang/mock)
- [gotests v1.6.0](https://github.com/cweill/gotests)
- [arch-go v0.8.3](https://github.com/fdaines/arch-go)
- generate-jwt-token.sh

### Build and push (should be automated in ci)

```
docker build -t mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3 alpine3.15-golang-1.17.3 &&\
docker push mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3
```

### Usage

Running bash:
```
docker run --rm -it mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3
```

Running specify tool
```
docker run --rm mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3 -c 'buf --help'
docker run --rm -e "SECRET=your-secret-key" -e "USER_ID=user-id" mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3 -c 'generate-jwt-token.sh'
docker run --rm -v $(pwd):/app -w /app mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3 -c 'mockgen -source=internal/domain/repository/account.go -destination=internal/adapter/repository/mock/account.go -package=mock'
docker run --rm -v $(pwd):/app -w /app mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3 -c 'gotests -all -w internal/domain/repository/account.go'
```

Running with going into container:
```
docker run --rm -it mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3
docker run --rm -it -v $(PWD):/app mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3
```


## alpine3.15-golang-1.18.1

utils in image:
- go
- buf
- curl
- [mockgen v1.6.0](https://github.com/golang/mock)
- [gotests v1.6.0](https://github.com/cweill/gotests)
- [arch-go v0.8.3](https://github.com/fdaines/arch-go)
- generate-jwt-token.sh

### Build and push (should be automated in ci)

```
docker build -t mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.18.1 alpine3.15-golang-1.18.1 &&\
docker push mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.18.1
```

### Usage

Running bash:
```
docker run --rm -it mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.18.1
```

Running specify tool
```
docker run --rm mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.18.1 -c 'buf --help'
docker run --rm -e "SECRET=your-secret-key" -e "USER_ID=user-id" mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.18.1 -c 'generate-jwt-token.sh'
docker run --rm -v $(pwd):/app -w /app mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.18.1 -c 'mockgen -source=internal/domain/repository/account.go -destination=internal/adapter/repository/mock/account.go -package=mock'
docker run --rm -v $(pwd):/app -w /app mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.18.1 -c 'gotests -all -w internal/domain/repository/account.go'
```

Running with going into container:
```
docker run --rm -it mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.18.1
docker run --rm -it -v $(PWD):/app mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.18.1
```
