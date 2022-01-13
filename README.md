# dockerized-utilities

## alpine3.15-golang-1.17.3

utils with link

- go
- buf
- curl
- generate-jwt-token.sh

### Build and push (should be automated in ci)

```
docker build -t mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3 alpine3.15-golang-1.17.3 &&\
docker push mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3
```

### Usage

Running specify tool
```
docker run --rm mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3 -c 'buf --help'
docker run --rm -e "SECRET=your-secret-key" -e "USER_ID=user-id" mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3 -c 'generate-jwt-token.sh'
```

Running with going into container:
```
docker run --rm -it mgerasimchuk/dockerized-utilities:alpine3.15-golang-1.17.3
```
