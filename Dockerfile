FROM jboss-eap73-runtime-openshift:latest
COPY /server $JBOSS_HOME
USER root
RUN yum install git -y
RUN rm -rf $JBOSS_HOME/standalone/deployments/*
RUN git clone -b https://github.com/pieterdauds/java-helloworld.git /tmp/apps
RUN cp /tmp/apps/helloworld.war $JBOSS_HOME/standalone/deployments/helloworld.war
RUN chown -R jboss:root $JBOSS_HOME && chmod -R ug+rwX $JBOSS_HOME
USER jboss
CMD $JBOSS_HOME/bin/openshift-launch.sh
