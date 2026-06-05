# Jenkins Installation Script

curl -fsSL https://raw.githubusercontent.com/shivaji67/Jenkins-Installation-Script-Ubuntu/main/install_jenkins.sh | bash

This repository contains an automated script to install Jenkins on Ubuntu/Debian systems.

## Prerequisites

* Ubuntu 24.04 / 22.04 / Debian-based Linux
* User with sudo privileges
* Internet connection

## What the Script Installs

* OpenJDK 21
* Jenkins Repository
* Jenkins Server
* Jenkins Service Configuration

## Installation

### Clone the Repository

```bash
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>
```

### Make the Script Executable

```bash
chmod +x install_jenkins.sh
```

### Run the Script

```bash
./install_jenkins.sh
```

## Verify Jenkins

Check service status:

```bash
sudo systemctl status jenkins
```

Check if Jenkins is listening:

```bash
sudo ss -tulpn | grep 8080
```

## Access Jenkins

Open your browser:

```text
http://<SERVER-IP>:8080
```

Example:

```text
http://192.168.1.100:8080
```

## Get Initial Admin Password

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy the password and paste it into the Jenkins setup page.

## Jenkins Service Commands

Start Jenkins:

```bash
sudo systemctl start jenkins
```

Stop Jenkins:

```bash
sudo systemctl stop jenkins
```

Restart Jenkins:

```bash
sudo systemctl restart jenkins
```

Check Status:

```bash
sudo systemctl status jenkins
```

Enable Jenkins on Boot:

```bash
sudo systemctl enable jenkins
```

## One-Line Installation

Run directly from GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/<your-username>/<your-repo>/main/install_jenkins.sh | bash
```

## Project Structure

```text
.
├── install_jenkins.sh
└── README.md
```

## License

MIT License
