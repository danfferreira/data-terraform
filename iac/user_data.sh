#!/bin/bash
# Update packages
apt-get update -y

# Install Docker and Git
apt-get install -y docker.io git

# Start and enable Docker service
systemctl start docker
systemctl enable docker

# Create a directory for your application
mkdir -p /opt/app

# Clone your repository (replace with your repository URL)
git clone git@github.com:danfferreira/data-terraform.git /opt/app

# Change to the application directory
cd /opt/app

# Optionally, checkout a specific branch or tag
# git checkout main

# Build the Docker image using the Dockerfile present in the repository
docker build -t my-app:latest .

# Run the Docker container in detached mode
docker run -d --name my-app-container my-app:latest
