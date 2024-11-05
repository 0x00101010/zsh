#/bin/bash
set -e

newgrp docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chgrp docker /var/run/docker.sock
