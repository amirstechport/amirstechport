# Docker Installation Script: Detailed Breakdown

Here's a **future-proof Bash script** for installing the latest Docker on **Ubuntu Server** along with a step-by-step guide explaining each command. This script follows best practices and ensures security by using the official Docker repository.

---

## **Docker Installation Script**

### Script: `install_docker.sh`

```bash
#!/bin/bash

# install_docker.sh - A script to install the latest Docker on Ubuntu Server
# Author: YourName
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
```

### **How to Use the Script**

1. **Download the Script**:  
    Clone the script from your GitHub repository or download it directly:
    
    ```bash
    wget https://raw.githubusercontent.com/YourUsername/YourRepo/main/install_docker.sh
    ```
    
2. **Make the Script Executable**:
    
    ```bash
    chmod +x install_docker.sh
    ```
    
3. **Run the Script**:
    
    ```bash
    ./install_docker.sh
    ```
    
4. **Log Out and Log Back In**:  
    If you want to run Docker commands without `sudo`, log out and log back in for the group changes to take effect.
    

---

## **Step-by-Step Explanation of the Script**

### 1. **Updating Package Index**

```bash
sudo apt update && sudo apt upgrade -y
```

- Updates the list of available packages and upgrades all installed packages to the latest versions.

### 2. **Installing Prerequisites**

```bash
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg
```

- Installs necessary dependencies for downloading and adding the Docker repository securely.

### 3. **Adding Docker’s Official GPG Key**

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

- Downloads Docker's official GPG key and saves it in a secure location to verify package authenticity.

### 4. **Adding Docker Repository**

```bash
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

- Adds Docker's official repository to the system’s package sources.

### 5. **Updating Package Index Again**

```bash
sudo apt update
```

- Updates the package list to include Docker packages from the newly added repository.

### 6. **Installing Docker**

```bash
sudo apt install -y docker-ce docker-ce-cli containerd.io
```

- Installs the latest versions of Docker Engine, Docker CLI, and the container runtime `containerd`.

### 7. **Enabling and Starting Docker Service**

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

- Ensures Docker starts automatically on boot and starts the service immediately.

### 8. **Verifying Docker Installation**

```bash
sudo docker --version
sudo docker run hello-world
```

- Checks the Docker version and runs a test container to verify Docker is working.

### 9. **Adding User to Docker Group**

```bash
sudo usermod -aG docker $USER
```

- Adds the current user to the `docker` group to allow running Docker commands without `sudo`.

---

### **Best Practices Followed**

1. **Security**:
    - Uses Docker's official repository and GPG key.
2. **Future-Proof**:
    - Fetches the latest stable Docker version from the repository.
3. **Error Handling**:
    - The `set -e` flag ensures the script exits on errors.
4. **User Convenience**:
    - Adds the user to the `docker` group for convenience.
5. **Clear Messaging**:
    - Provides color-coded messages for each step to improve readability.

This script ensures you have an up-to-date and secure Docker installation. 🚀

