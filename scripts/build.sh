#!/bin/env bash

SECONDS_SINCE_EPOCH=$(printf '%(%s)T\n' -1)

TAG=$SECONDS_SINCE_EPOCH

./gradlew build
docker build -t mwelke/javalin-jlink-test:$TAG .
