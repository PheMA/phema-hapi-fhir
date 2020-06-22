#!/bin/bash

# Log in cto the Bintray Docker registry
echo "$DOCKERHUB_API_KEY" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin

set -o xtrace

# build
./build-docker-image.sh

# tag
docker tag phema/phema-hapi-fhir phema/phema-hapi-fhir:$TRAVIS_TAG

# list images
docker images

# Push the image
docker push phema/phema-hapi-fhir:$TRAVIS_TAG