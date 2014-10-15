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
