#!/bin/bash

# Log in cto the Bintray Docker registry
echo "$DOCKERHUB_API_KEY" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin phema-docker-docker.bintray.io

set -o xtrace

# build
docker build -t phema/hapi-fhir:$TRAVIS_TAG ../

# list images
docker images

# Push the image
docker push phema/phema-hapi-fhir:$TRAVIS_TAG