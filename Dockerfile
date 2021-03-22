FROM jboss-eap73-runtime-openshift:7.3
COPY /server $JBOSS_HOME
USER root
RUN yum install git -y
RUN rm -rf $JBOSS_HOME/standalone/deployments/*
RUN git clone -b main https://github.com/nixonguo/test.git /tmp/apps
RUN cp /tmp/apps/ROOT.war $JBOSS_HOME/standalone/deployments/ROOT.war
RUN chown -R jboss:root $JBOSS_HOME && chmod -R ug+rwX $JBOSS_HOME
USER jboss
CMD $JBOSS_HOME/bin/openshift-launch.sh
