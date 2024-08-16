build:
	./scripts/build.sh $(IMAGE_NAME) $(IMAGE_TAG)

docker-login:
	./scripts/docker.sh