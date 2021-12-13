#!/bin/bash
docker build --no-cache -t hackinglab/alpine-nginx-with-theia-web-ide:3.2.0 -t hackinglab/alpine-nginx-with-theia-web-ide:3.2 -t hackinglab/alpine-nginx-with-theia-web-ide:latest -f Dockerfile .
