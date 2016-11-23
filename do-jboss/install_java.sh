#!/bin/bash

sleep 30
export JAVA_VERSION=8u112
export BUILD_VERSION=b15
yum -y upgrade
yum -y install wget
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm
yum -y install /tmp/jdk-8-linux-x64.rpm
alternatives --install /usr/bin/java jar /usr/java/lastest/bin/java 200000
alternatives --install /usr/bin/javaws javaws /usr/java/lastest/bin/javaws 200000
alternatives --install /usr/bin/javac javac /usr/java/lastest/bin/javac 200000
export JAVA_HOME=/usr/java/lastest && echo "JAVA_HOME=/usr/java/lastest" >> ~/.bash_profile
