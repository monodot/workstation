#!/bin/sh

JENKINS_VOLUME=/opt/jenkins
JENKINS_PORT=49001

if [ ! -d $JENKINS_VOLUME ]; then
	sudo mkdir -p $JENKINS_VOLUME
	sudo chown $USER:$USER $JENKINS_VOLUME
	echo "Created Jenkins volume directory $JENKINS_VOLUME"
fi

docker run --rm --name jenkins -d -p $JENKINS_PORT:8080 -v $JENKINS_VOLUME:/var/jenkins_home:z -t jenkins/jenkins:latest

echo "Jenkins running shortly on http://localhost:$JENKINS_PORT"

