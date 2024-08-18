# github-base-templates
Base repository for developer templates

## Requirements:
1. Create a Container repository (e.g. [DockerHub](https://hub.docker.com/repository/docker/joaotiagoalmeid4/github-base-templates/general)), and a token to publish new images.
2. On the actions settings of the repo: https://github.com/Joao-Tiago-Almeida/MY-REPO/settings/actions update accordingly.
On the variables and secretes settings of the repo: https://github.com/Joao-Tiago-Almeida/MY-REPO/settings/secrets/actions add
- Save the `DOCKERHUB_TOKEN` on the secrets of the repo.
- Save the `DOCKERHUB_USERNAME` on the vars of the repo.

## Usage:
For usage reference, check how these templates are used in [this repo](https://github.com/Joao-Tiago-Almeida/github-base-templates/blob/main/.github/workflows/cicd.yml); [different repo](https://github.com/Joao-Tiago-Almeida/GoTyping/blob/main/.github/workflows/cicd.yml);

### [Build Template](./.github/workflows/build.yml)
This GitHub Actions workflow is used to build and push a Docker image to DockerHub.

Inputs:
- `IMAGE_NAME`: (optional) The name of the Docker image. If not provided, it will default to the repository name.
- `IMAGE_TAG`: (optional) The tag for the Docker image. If not provided, it will default to "build-{github.sha}".
- `DOCKERFILE`: (optional) The path to the Dockerfile. If not provided, it will default to "Dockerfile".
- `DOCKERFILE_CONTEXT`: (optional) The context for the Dockerfile. If not provided, it will default to ".".

Secrets:
- DOCKERHUB_TOKEN: The DockerHub token for authentication.

Steps:
1. Checkout repository.
2. Build the Docker image using the specified Dockerfile, image name, and image tag.
3. Login to DockerHub using the DockerHub username and the provided token.
4. Push the Docker image to DockerHub using the specified image name and image tag.

The workflow runs on an Ubuntu environment and has a timeout of 1 minute.

### [Tag Template](./.github/workflows/tag.yml)

Tag and Push Template

This GitHub Actions workflow is used to tag and push Docker images to DockerHub. It pulls the specified image, tags it with new names, and pushes the tagged images to DockerHub.

Inputs:
  - `OLD_IMAGE_NAME`: (optional) The name of the old Docker image. Defaults to the repository name.
  - `OLD_IMAGE_TAG`: (optional) The tag of the old Docker image. Defaults to "build-{github.sha}".
  - `NEW_IMAGE_NAME`: (optional) The name of the new Docker image. Defaults to the repository name.
  - `NEW_IMAGE_TAG`: (optional) The tag of the new Docker image. Defaults to "rc-{github.sha}".

Secrets:
  - DOCKERHUB_TOKEN: The DockerHub token used for authentication.

Steps:
  1. Checkout repository: Checks out the repository code.
  2. Login in DockerHub: Logs in to DockerHub using the provided credentials.
  3. Pull the Image: Pulls the specified old Docker image.
  4. Tag the Images: Tags the old Docker image with the new names.
  5. Push the Images: Pushes the tagged images to DockerHub.

The workflow runs on an Ubuntu environment and has a timeout of 1 minute.