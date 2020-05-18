#!/bin/sh

NEXUS_VOLUME=/opt/nexus3/nexus-data
NEXUS_PORT=8086
DOCKER_GROUP=docker

if [ ! -d $NEXUS_VOLUME ]; then
        sudo mkdir -p $NEXUS_VOLUME
        sudo chown $USER:$DOCKER_GROUP $NEXUS_VOLUME
        echo "Created Nexus volume directory"
fi

# Running this non-persistent because I'm tired and I don't know what's broken about this.
#docker run --rm --name nexus3 -d -p $NEXUS_PORT:8081 -v $NEXUS_VOLUME:/nexus-data:z sonatype/nexus3

docker run --rm --name nexus3 -d -p $NEXUS_PORT:8081 sonatype/nexus3

echo "Nexus3 running shortly on http://localhost:$NEXUS_PORT"

