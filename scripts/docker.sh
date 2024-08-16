set -eu

# Log into Docker Hub
echo "Logging into Docker Hub as $(DOCKERHUB_USERNAME)"
docker login --username $DOCKERHUB_USERNAME --password $DOCKERHUB_TOKEN