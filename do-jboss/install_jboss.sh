#!/bin/bash

export WILDFLY_VERSION=10.1.0.Final
export WILDFLY_SHA1=9ee3c0255e2e6007d502223916cefad2a1a5e333
export JBOSS_HOME=/opt/wildfly
echo "JBOSS_HOME=/opt/wildfly" >> ~/.bash_profile

cd $HOME && curl -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz && sha1sum wildfly-$WILDFLY_VERSION.tar.gz | grep $WILDFLY_SHA1 && tar xf wildfly-$WILDFLY_VERSION.tar.gz && mv $HOME/wildfly-$WILDFLY_VERSION $JBOSS_HOME && rm wildfly-$WILDFLY_VERSION.tar.gz

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
export LAUNCH_JBOSS_IN_BACKGROUND=true
echo "LAUNCH_JBOSS_IN_BACKGROUND=true" >> ~/.bash_profile

adduser -M wildfly
chown -R wildfly:wildfly $JBOSS_HOME

# set listen interface to 0.0.0.0 instead of 127.0.0.1
sed -i -e 's,<inet-address value="${jboss.bind.address:127.0.0.1}"/>,<any-address/>,g' /opt/wildfly/standalone/configuration/standalone.xml
sed -i -e 's,<inet-address value="${jboss.bind.address.management:127.0.0.1}"/>,<any-address/>,g' /opt/wildfly/standalone/configuration/standalone.xml

# set Wildfly as linux service.
cp /opt/wildfly/docs/contrib/scripts/init.d/wildfly-init-redhat.sh /etc/init.d/wildfly
cp /opt/wildfly/docs/contrib/scripts/init.d/wildfly.conf /etc/default/
echo "JBOSS_USER=wildfly" >> /etc/default/wildfly.conf
chkconfig --add wildfly
chkconfig wildfly on
# chown -R wildfly:wildfly /var/run/wildfly
# chown -R wildfly:wildfly /var/log/wildfly
``