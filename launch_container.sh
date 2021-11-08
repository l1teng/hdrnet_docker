IMAGE_NAME="terrytengli/hdrnet"
IMAGE_TAG="latest"
CONTAINER_NAME="hdrnet"
DEVICES_LIST="0,1"
SHARE_MEM_SIZE="8g"

docker run -itd --name $CONTAINER_NAME --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=$DEVICES_LIST --shm-size $SHARE_MEM_SIZE $IMAGE_NAME:$IMAGE_TAG
