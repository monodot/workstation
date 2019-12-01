#!/bin/sh

NEXUS_VOLUME=$HOME/.local/share/nexus2
NEXUS_PORT=8085

if [ ! -d $NEXUS_VOLUME ]; then
        mkdir -p $NEXUS_VOLUME/nexus-data/sonatype-work/conf
        echo "Created Nexus volume directory"
	cp "$(dirname "${BASH_SOURCE}")/nexus.xml" $NEXUS_VOLUME/nexus-data/sonatype-work/conf/nexus.xml
        echo "Copied default nexus.xml to conf directory"
fi

podman run --rm --name nexus2 -p $NEXUS_PORT:8081 -v $NEXUS_VOLUME:/sonatype-work:Z --userns=keep-id -d sonatype/nexus

echo "Nexus running shortly on http://localhost:$NEXUS_PORT"

