#! /bin/bash
# Script to delete all existing containers connected to SeoulAir microservices at once.


root_dir="./"

if [ "$#" -gt 1 ]; then
	echo "Too many arguments. "
	echo "Script has only one optional parameter and that is the root of the repository group"
	exit 1
fi

if [ "$#" -eq 1 ] && ! [ -d "$1" ]; then
	  echo "Usage: $1 DIRECTORY" >&2
	  exit 1
else
	root_dir=$1
fi

if [ ! -d "$root_dir/seoulair-device" ]; then
	echo "SeoulAir.Device microservice is missing or it not on right place."
	exit 1
fi

if [ ! -d "$root_dir/seoulair-command" ]; then
	echo "SeoulAir.Command microservice is missing or it not on right place."
	exit 1
fi

if [ ! -d "$root_dir/seoulair-analytics" ]; then
	echo "SeoulAir.Analytics microservice is missing or it not on right place."
	exit 1
fi

if [ ! -d "$root_dir/seoulair-data" ]; then
	echo "SeoulAir.Data microservice is missing or it not on right place."
	exit 1
fi

#if [ ! -d "./seoulair-gateway" ]; then
#	echo "SeoulAir.Gateway microservice is missing or it not on right place."
#	exit 1
#fi

if systemctl status docker | grep -q 'inactive (dead)'; then
	echo "Docker service is not running. Check if everything is ok with docker deamon."
	exit 1
fi

if docker-compose --version | grep -q 'command not found'; then
	echo "In order to use automation script you must have docker-compose installed."
	exit 1
fi

docker-compose -f $root_dir/seoulair-device/docker-compose.yml down
docker-compose -f $root_dir/seoulair-command/docker-compose.yml down
docker-compose -f $root_dir/seoulair-analytics/docker-compose.yml down
docker-compose -f $root_dir/seoulair-data/docker-compose.yml down
#docker-compose -f ./seoulair-gateway/docker-compose.yml down