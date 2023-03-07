#Create network
docker network create -d bridge bds-network
#Create hadoop base image
cd hadoop/base && docker build . -t hadoop-base --progress=plain --no-cache && cd ../..
#Create spark base image
cd spark/base && docker build . -t spark-base --progress=plain --no-cache && cd ../..
#Start all containers
docker-compose up
