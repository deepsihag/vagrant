#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y openjdk-7-jdk
sudo apt-get install -y tomcat7
echo mysql-server mysql-server/root_password password mypassword | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again password mypassword | sudo debconf-set-selections
sudo apt-get -y install mysql-server
sudo cp /vagrant/vagrant.war /var/lib/tomcat7/webapps