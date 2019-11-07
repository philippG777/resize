#!/bin/bash
IMAGES=`ls *.JPG 2>/dev/null && ls *.jpg 2>/dev/null`
SIZE_S="1280x720"
SIZE_M="1920x1080"
SIZE_L="2560x1600"

SIZES=($SIZE_S $SIZE_M $SIZE_L)
NAME_PARTS=("s" "m" "l")

echo "Staring resizing"

for IMAGE in $IMAGES
do
	NAME=${IMAGE%.*}
	EXT=${IMAGE##*.}
	
	for i in "${!SIZES[@]}"; do
		NEW_NAME="${NAME}-${NAME_PARTS[$i]}.${EXT}"
		convert $IMAGE -resize ${SIZES[$i]} $NEW_NAME
	done
done

echo "done ..."
