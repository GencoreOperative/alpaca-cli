# Assemble 
# Usage:
# make         # compile each version of the Docker image
# make publish # Publish the latest version to Docker.io
# make clean   # Clean the local working folder

all: build

.PHONY: clean publish

# Search in the boot folder for recipe dependencies and recipe outputs
VPATH = docker

# Generated Docker images are tagged using the current Git version
alpaca-git-commit = c5ae5d08a5
git-commit = $(shell git rev-parse --short HEAD)

tag-name = gencore/alpaca.cpp
docker-tag = $(tag-name):$(alpaca-git-commit)-$(git-commit)
docker-tag-latest = $(tag-name):latest

ggml-alpaca-7b-q4.bin: download.txt
	(cd docker && sh download.sh ggml-alpaca-7b-q4.bin)

build: ggml-alpaca-7b-q4.bin
	DOCKER_BUILDKIT=1 docker build \
	    --build-arg ALPACA_COMMIT=$(alpaca-git-commit) \
	    -t $(docker-tag) \
	    -t $(docker-tag-latest) \
	    docker

clean:

publish: build
	@echo "Pushing to DockerHub"
	docker login
	docker push $(docker-tag)
	docker push $(docker-tag-latest)