docker container stop $1
docker rm $1
docker image build -t $1 .
docker container run \
    --mount type=bind,src=$(pwd),dst=/home/Apps/$1 \
    -it \
    -d \
    --name $1 $1
docker container exec -it $1 /bin/bash