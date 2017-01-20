#!/usr/bin/env sh

docker run -it --rm -v $PWD:/usr/src/summon-cerberus -w /usr/src/summon-cerberus golang bash -c '
goos="darwin linux"
arch="amd64"
go get
for GOOS in $goos; do
  for GOARCH in $arch; do
    go build -v -o pkg/${GOOS}_${GOARCH}/summon-cerberus
  done
done
'
