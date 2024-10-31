# Run official "Docker Engine for Linux" installation script
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh

# Setting up the Docker daemon in rootless mode for your user
# But first install newuidmap & newgidmap binaries
sudo apt-get install -y uidmap

dockerd-rootless-setuptool.sh install

# Limit log size to avoid running out of disk
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5", "iptables":false}}' | sudo tee /etc/docker/daemon.json
