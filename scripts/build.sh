# bin/bash

set -eux

IMAGE_NAME=${1:-"${PWD##*/}"}    # Default image name
IMAGE_TAG=${2:-"latest"}        # Default image tag

echo "Building image $IMAGE_NAME"
docker build \
    --build-arg="IMAGE_NAME=$IMAGE_NAME" \
    -t $IMAGE_NAME:$IMAGE_TAG \
    .
