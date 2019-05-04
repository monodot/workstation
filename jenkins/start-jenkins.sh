#!/bin/sh

JENKINS_VOLUME=/opt/jenkins

if [ ! -d $JENKINS_VOLUME ]; then
	sudo mkdir -p $JENKINS_VOLUME
	sudo chown $USER:$USER $JENKINS_VOLUME
	echo "Created Jenkins volume directory"
fi

docker run -d -p 49001:8080 -v $JENKINS_VOLUME:/var/jenkins_home:z -t jenkins

