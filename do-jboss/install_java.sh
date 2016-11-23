#!/bin/bash

export JAVA_VERSION=8u112
export BUILD_VERSION=b15
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm
yum -y install /tmp/jdk-8-linux-x64.rpm
export JAVA_HOME=/usr/java/latest 
echo "JAVA_HOME=/usr/java/latest" >> ~/.bash_profile
