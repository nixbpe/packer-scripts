#!/bin/bash

export WILDFLY_VERSION=10.1.0.Final
export WILDFLY_SHA1=9ee3c0255e2e6007d502223916cefad2a1a5e333
export JBOSS_HOME=/opt/jboss/wildfly
echo "JBOSS_HOME=/opt/jboss/wildfly" >> ~/.bash_profile

mkdir -p $JBOSS_HOME
cd $HOME && curl -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz && sha1sum wildfly-$WILDFLY_VERSION.tar.gz | grep $WILDFLY_SHA1 && tar xf wildfly-$WILDFLY_VERSION.tar.gz && mv $HOME/wildfly-$WILDFLY_VERSION $JBOSS_HOME && rm wildfly-$WILDFLY_VERSION.tar.gz

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
export LAUNCH_JBOSS_IN_BACKGROUND=true
echo "LAUNCH_JBOSS_IN_BACKGROUND=true" >> ~/.bash_profile
