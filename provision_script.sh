#!/usr/bin/env bash

/bin/bash --login

sudo apt-get update
sudo apt-get install tomcat7 --yes

sudo apt-get install python-software-properties --yes
sudo add-apt-repository ppa:webupd8team/java --yes
sudo apt-get update

echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
sudo apt-get install oracle-java7-installer --yes

cd /var/lib/tomcat7/webapps/ && sudo wget http://repo1.maven.org/maven2/org/fcrepo/fcrepo-webapp/4.0.0-beta-03/fcrepo-webapp-4.0.0-beta-03.war
sudo service tomcat7 restart
