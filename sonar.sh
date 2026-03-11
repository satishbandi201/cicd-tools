sudo yum install java-17-openjdk -y
sudo yum install wget unzip -y
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.4.87374.zip
unzip sonarqube-9.9.4.87374.zip
mv sonarqube-9.9.4.87374 sonarqube
sudo useradd sonar
sudo chown -R sonar:sonar sonarqube
sudo mv sonarqube /opt/sonarqube
sudo su - sonar
sudo chown -R sonar:sonar /opt/sonarqube
cd /opt/sonarqube/bin/linux-x86-64
./sonar.sh start