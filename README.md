# Docker for Ethereum develoment

This docker generate a local enviroment for developement

At the moment only include `hardhat` and `brownie`

## Getting Started

Once cloned the repo, simply execute: `./run-sandbox.sh`

The script build and run the docker.

## how to bulid
``
docker build \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    --build-arg USER=$(id -un) \
    --build-arg GROUP=$(id -gn) \
    -t ethdev-sandbox docker
```

## How to run

Some files and directories are necessary to run the docker properly:
```
mkdir -p .brownie .solcx .vvm
touch .bash_history
```

The docker needs to have some special config to run:
``
docker run  \
	-v $(pwd):$(pwd) \
	-v $(pwd)/.brownie:/home/$USER/.brownie \
	-v $(pwd)/.solcx:/home/$USER/.solcx \
	-v $(pwd)/.vvm:/home/$USER/.vvm \
	-v $(pwd)/.bash_history:/home/$USER/.bash_history \
	--workdir $(pwd) \
	--network host \
       	-e APT_HTTP_PROXY \
	-e PYDOJOBS \
	-e TERM \
	--hostname proxy-sandbox \
	--cap-add=SYS_PTRACE \
	--security-opt seccomp=unconfined \
	--privileged \
	--rm \
	-it ethdev-sandbox
```
