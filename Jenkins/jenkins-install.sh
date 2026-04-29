#!/bin/bash

echo "=== Update system ==="
sudo apt update
sudo apt install fontconfig openjdk-21-jre
java --version

echo "=== Add Jenkins key ==="
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

echo "=== Add Jenkins repository ==="
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
echo "deb [allow-insecure=yes] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list

echo "=== Install Jenkins ==="
sudo apt update
sudo apt install jenkins

echo "=== Start Jenkins ==="
sudo systemctl start jenkins
sudo systemctl start jenkins
sudo systemctl enable --now jenkins
sudo ufw allow 8080/tcp
sudo ufw reload