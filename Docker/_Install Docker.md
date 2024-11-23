
---

### **Commands to Install Docker and Docker Compose, and Run Docker Without `sudo`:**

```bash
# Update package information and install Docker
sudo apt-get update
sudo apt-get install -y docker.io

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Install Docker Compose plugin
sudo apt-get update
sudo apt-get install -y docker-compose-plugin

# Add your user to the Docker group to run Docker without 'sudo'
sudo usermod -aG docker <linux_username>

# Refresh group membership without reboot
newgrp docker
```

---

### **Explanation of Each Command:**

1. **Install Docker:**
   - `sudo apt-get update`: Updates the package lists to ensure you have the latest versions.
   - `sudo apt-get install -y docker.io`: Installs Docker from the default Ubuntu repository.

2. **Enable and Start Docker Service:**
   - `sudo systemctl enable docker`: Ensures Docker starts at boot.
   - `sudo systemctl start docker`: Starts the Docker service immediately.

3. **Install Docker Compose Plugin:**
   - `sudo apt-get install -y docker-compose-plugin`: Installs the official Docker Compose plugin.

4. **Allow Running Docker Without `sudo`:**
   - `sudo usermod -aG docker <linux_username>`: Adds your Linux user to the Docker group, granting permission to run Docker commands without `sudo`.
   - Replace `<linux_username>` with your actual username (use `whoami` to get it dynamically if needed).

5. **Refresh Group Membership:**
   - `newgrp docker`: Applies the group membership changes immediately without requiring a logout/login or reboot.

---

### **Common Issues and Tips:**
- **Verify Docker Installation:**
   ```bash
   docker --version
   docker-compose --version
   ```
- **Post-Installation Test:**
   Run the following command to ensure Docker works without `sudo`:
   ```bash
   docker run hello-world
   ```
   This should pull and run a test image.

- If `docker-compose` doesn't work as expected, consider installing it manually by downloading its binary. Use the [Docker Compose installation guide](https://docs.docker.com/compose/install/) for reference.
