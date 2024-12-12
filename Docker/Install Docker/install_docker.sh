#!/bin/bash

# install_docker.sh - A script to install the latest Docker on Ubuntu Server
# Author: amirstechport
# License: MIT

set -e  # Exit immediately if a command exits with a non-zero status
set -u  # Treat unset variables as an error

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'  # No Color

echo -e "${GREEN}Updating package index...${NC}"
sudo apt update && sudo apt upgrade -y

echo -e "${GREEN}Installing prerequisites...${NC}"
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg

echo -e "${GREEN}Adding Docker's official GPG key...${NC}"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo -e "${GREEN}Adding Docker repository...${NC}"
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "${GREEN}Updating package index to include Docker repository...${NC}"
sudo apt update

echo -e "${GREEN}Installing the latest Docker Engine...${NC}"
sudo apt install -y docker-ce docker-ce-cli containerd.io

echo -e "${GREEN}Enabling and starting Docker service...${NC}"
sudo systemctl enable docker
sudo systemctl start docker

echo -e "${GREEN}Verifying Docker installation...${NC}"
sudo docker --version
sudo docker run hello-world

echo -e "${GREEN}Adding current user to the Docker group (optional)...${NC}"
sudo usermod -aG docker $USER

echo -e "${GREEN}Installation complete! Please log out and log back in to use Docker without sudo.${NC}"