#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y openjdk-21-jdk maven git

cd /home/ubuntu
git clone https://github.com/Trainings-TechEazy/test-repo-for-devops.git app
cd app
mvn clean package
sudo nohup java -jar target/hellomvc-0.0.1-SNAPSHOT.jar --server.port=80 > /home/ubuntu/app.log 2>&1 &
