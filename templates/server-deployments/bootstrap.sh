#!/bin/bash

# Fun ASCII header
echo "🌟 Welcome to the Bootstrap Template Installer 🌟"
echo "      _____      _            _       _       _             "
echo "     | __  | ___| |_ ___ ___| |___ _| |___ _| |___ ___ ___  "
echo "     |    -| -_|  _| -_| . | | -_| . | -_| . | . | -_|  _| "
echo "     |__|__|___|_| |___|  _|_|___|___|___|___|___|___|_|   "
echo "                     |_|                                 "
echo

# Step 1: Update apt
echo "🔄 Updating package list..."
sudo apt update -y

# Step 2: Install git
echo "🐙 Installing Git..."
sudo apt install git -y

# Step 3: Install the latest Docker and Docker Compose
echo "🐋 Installing Docker and Docker Compose..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
echo "🔧 Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker --version
docker-compose --version

# Step 4: Clone the templates folder
echo "🌱 Cloning only the 'templates' folder from .dotfiles..."
git clone --no-checkout https://github.com/admondtamang/.dotfiles.git
cd .dotfiles
git sparse-checkout init --cone
git sparse-checkout set templates
git checkout main

# Step 5: Move server deployment folders to home directory
echo "🚚 Moving server deployment folders to home directory..."
cd templates/server-deployments
for dir in */; do
  mv "$dir" ~/
done

# Step 6: Move Docker Compose folder to home directory
echo "📦 Moving Docker Compose folder to home directory..."
cd ../docker-compose
mkdir -p ~/docker-compose
cp -r * ~/docker-compose/

# Final message
echo "✅ All done! Docker, Docker Compose, and the server deployment folders are ready to use. Have a productive day!"
