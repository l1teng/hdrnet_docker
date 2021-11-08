DOCKER_IMAGE_NAME="terrytengli/hdrnet"
DOCKER_IMAGE_TAG="latest"
DOCKERFILE="Dockerfile"
docker image build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG -f $DOCKERFILE .
