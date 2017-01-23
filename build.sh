#!/usr/bin/env sh

docker run -it --rm -v $PWD:/usr/src/summon-cerberus -w /usr/src/summon-cerberus golang bash -c '
goos="darwin linux"
arch="amd64"
VERSION=$(grep -Po -m1 "(?<=## \[)[0-9.]+" CHANGELOG.md)
go get
for GOOS in $goos; do
  for GOARCH in $arch; do
    go build -v -o pkg/${GOOS}_${GOARCH}/summon-cerberus
    pushd pkg/${GOOS}_${GOARCH}/
    tar -czvf summon-cerberus_v${VERSION}_${GOOS}_${GOARCH}.tar.gz ./summon-cerberus
    popd
  done
done
'
