#/bin/bash
set -e

echo '{"data-root": "/data/docker"}' | sudo tee /etc/docker/daemon.json >/dev/null
sudo systemctl restart docker
