docker build \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    --build-arg USER=$(id -un) \
    --build-arg GROUP=$(id -gn) \
    -t ethdev-sandbox docker

mkdir -p .brownie .solcx .vvm
touch .bash_history

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
