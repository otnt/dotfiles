# install docker engine
apt-get update && \
apt-get install curl && \
curl -fsSL https://get.docker.com/ | sh && \
echo "docker engine installed successfully"

# install docker machine
curl -L https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
chmod +x /usr/local/bin/docker-machine && \
echo "docker machine installed successfully"
