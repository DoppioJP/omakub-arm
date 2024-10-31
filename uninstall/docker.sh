# Stop the Docker Application Container Engine
sudo systemctl stop docker.socket

# Stop the rootless one
systemctl --user stop docker.service

# Purge Docker related packages
sudo apt purge --auto-remove docker-ce docker-ce-cli docker.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

# Remove Docker runtime data storage
sudo rm -rf /var/lib/docker

# Remove configuration files related to the Docker daemon
sudo rm -rf /etc/docker

# Delete AppArmor security profile for Docker
sudo rm -rf /etc/apparmor.d/docker

# Delete docker user group
sudo groupdel docker

# Delete user files
rm -f /home/${USER}/.config/systemd/user/docker.service
