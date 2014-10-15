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

sudo sed -i 's/Xmx128m/Xmx768m -Dfcrepo.home=\/home\/vagrant\/f4home/g' /etc/default/tomcat7
sudo sh -c 'echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/default/tomcat7'
sudo sh -c 'echo "PATH=/usr/lib/jvm/java-7-oracle/bin:$PATH" >> /etc/default/tomcat7'

mkdir /home/vagrant/f4home
sudo chgrp tomcat7 /home/vagrant/f4home

cd /var/lib/tomcat7/webapps/ && sudo wget http://repo1.maven.org/maven2/org/fcrepo/fcrepo-webapp/4.0.0-beta-03/fcrepo-webapp-4.0.0-beta-03.war
sudo service tomcat7 restart
