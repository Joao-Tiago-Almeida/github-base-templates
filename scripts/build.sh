# bin/bash

set -eux

DOCKERFILE=${1:-"Dockerfile"}    # Default Dockerfile
DOCKERFILE_CONTEXT=${2:-"."}         # Default build context
IMAGE_NAME=${3:-"${PWD##*/}"}    # Default image name
IMAGE_TAG=${4:-"latest"}        # Default image tag

env | sort

echo "Building image $IMAGE_NAME"
docker build \
    --build-arg="IMAGE_NAME=$IMAGE_NAME" \
    -t $IMAGE_NAME:$IMAGE_TAG \
    $DOCKERFILE_CONTEXT
