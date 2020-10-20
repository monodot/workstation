#!/bin/sh

NEXUS_VOLUME=$HOME/.local/share/nexus2
NEXUS_PORT=8085

if [ ! -d $NEXUS_VOLUME ]; then
        mkdir -p $NEXUS_VOLUME
        echo "Created Nexus volume directory"
        mkdir -p $NEXUS_VOLUME/conf
	cp "$(dirname "${BASH_SOURCE}")/nexus.xml" $NEXUS_VOLUME/conf/nexus.xml
        echo "Copied default nexus.xml to conf directory"
fi

bashSource=$(dirname "${BASH_SOURCE}")
echo "Bash source detected as: ${bashSource}"

# Nexus container runs as UID 200, so ensure the volume dir has the right owner/group:
# podman unshare chown 200:200 -R /home/tdonohue/.local/share/nexus2
podman run --detach --rm --name nexus2 -p $NEXUS_PORT:8081 \
	-v $NEXUS_VOLUME:/sonatype-work:Z \
	-v ${bashSource}/nexus.properties:/opt/sonatype/nexus/conf/nexus.properties:Z \
	sonatype/nexus

echo "Nexus running shortly on http://localhost:$NEXUS_PORT"

