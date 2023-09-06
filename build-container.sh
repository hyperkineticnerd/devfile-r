#!/bin/bash
#####
DEFAULT_IMAGE_PLATFORMS="linux/amd64,linux/arm64/v8"
IMAGE_PLATFORMS="linux/amd64"

IMAGE_REGISTRY="${IMAGE_REGISTRY:-quay.io}"
IMAGE_NAMESPACE="${IMAGE_NAMESPACE:-hyperkineticnerd}"
IMAGE_NAME="${IMAGE_NAME:-devfile-r}"
IMAGE_TAG="${IMAGE_TAG:-latest}"

BASE_NAME="${IMAGE_REGISTRY}/${IMAGE_NAMESPACE}/${IMAGE_NAME}:${IMAGE_TAG}"
BUILD_PATH="."

podman manifest create ${BASE_NAME}

podman build \
    --manifest ${BASE_NAME} \
    --platform ${IMAGE_PLATFORMS} \
    ${BUILD_PATH}

podman manifest push "${BASE_NAME}"
