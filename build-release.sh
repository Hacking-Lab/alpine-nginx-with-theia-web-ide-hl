#!/bin/bash
docker build --no-cache -t hackinglab/alpine-nginx-with-theia-web-ide:$1.0 -t hackinglab/alpine-nginx-with-theia-web-ide:$1 -t hackinglab/alpine-nginx-with-theia-web-ide:latest -f Dockerfile .

docker push hackinglab/alpine-nginx-with-theia-web-ide
docker push hackinglab/alpine-nginx-with-theia-web-ide:$1
docker push hackinglab/alpine-nginx-with-theia-web-ide:$1.0

