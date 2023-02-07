docker container stop dispy2_dev
docker rm dispy2_dev
docker image build -t dispy2_dev .
docker container run -it -d --name dispy2_dev dispy2_dev