#!/usr/bin/env sh

set -e

ACR_NAME='octavedev'
REPO_NAME='platform_build_auth'
SUBSCRIPTION='OCTAVE-DEV'

if [ $# -eq 0 ]
  then
    TAG=`git rev-parse --short HEAD`
    echo "Using Git Tag $TAG"
else
    TAG=$1
fi

echo "Building, Tagging, and Pushing container with Tag: $TAG"

az acr login --name $ACR_NAME --subscription $SUBSCRIPTION

docker build -t $ACR_NAME.azurecr.io/$REPO_NAME:$TAG .

docker push $ACR_NAME.azurecr.io/$REPO_NAME:$TAG
