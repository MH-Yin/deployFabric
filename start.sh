#!/bin/bash

docker-compose -f compose/docker-orderer.yaml up -d
docker-compose -f compose/docker-peer.yaml up -d