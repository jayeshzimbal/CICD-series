#!/bin/bash
set -x 
set -e
set -o pipefail

echo "Updating packages..."
sudo apt update -y

echo "Installing Java..."
sudo apt install -y fontconfig openjdk-21-jdk

echo "Creating keyrings directory..."
sudo mkdir -p /etc/apt/keyrings

echo "Downloading Jenkins GPG Key..."
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "Adding Jenkins Repository..."
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating repository..."
sudo apt update -y

echo "Installing Jenkins..."
sudo apt install -y jenkins

echo "Starting Jenkins..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "Checking Jenkins Status..."
sudo systemctl status jenkins --no-pager

echo
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword