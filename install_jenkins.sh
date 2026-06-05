#!/bin/bash

set -euo pipefail

echo "====================================="
echo " Jenkins Installation Script"
echo "====================================="

if [ "$EUID" -ne 0 ]; then
echo "Please run as root or use sudo."
exit 1
fi

echo "[1/8] Updating packages..."
apt update

echo "[2/8] Installing dependencies..."
apt install -y curl wget gnupg lsb-release ca-certificates fontconfig openjdk-21-jre

echo "[3/8] Verifying Java..."
java -version

echo "[4/8] Cleaning old Jenkins repositories..."
rm -f /etc/apt/sources.list.d/jenkins.list
rm -f /etc/apt/keyrings/jenkins-keyring.asc
rm -f /usr/share/keyrings/jenkins-keyring.gpg

echo "[5/8] Creating keyring directory..."
mkdir -p /usr/share/keyrings

echo "[6/8] Importing Jenkins GPG key..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | 
gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg

echo "[7/8] Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" \

> /etc/apt/sources.list.d/jenkins.list

echo "[8/8] Installing Jenkins..."
apt update
apt install -y jenkins

echo "Enabling Jenkins service..."
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

echo ""
echo "====================================="
echo " Jenkins Installation Complete"
echo "====================================="
echo ""

systemctl --no-pager --full status jenkins || true

echo ""
echo "Initial Admin Password:"
echo "-------------------------------------"
cat /var/lib/jenkins/secrets/initialAdminPassword
echo "-------------------------------------"
echo ""

IP=$(hostname -I | awk '{print $1}')

echo "Access Jenkins at:"
echo "http://${IP}:8080"
echo ""
