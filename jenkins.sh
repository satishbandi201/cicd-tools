#!/bin/bash

#resize disk from 20GB to 50GB
growpart /dev/nvme0n1 4

lvextend -L +10G /dev/RootVG/rootVol
lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

xfs_growfs /
xfs_growfs /var/tmp
xfs_growfs /var

sudo dnf install java-17-openjdk -y
sudo dnf install curl -y
sudo curl -L https://pkg.jenkins.io/redhat-stable/jenkins.repo -o /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnf install jenkins -y
# #sudo curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# sudo yum install fontconfig java-21-openjdk -y
# sudo yum install jenkins -y

sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins