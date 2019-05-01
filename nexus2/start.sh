#!/bin/sh
docker run --rm -d -p 8085:8081 --name nexus -v /opt/nexus/nexus-data:/sonatype-work:z sonatype/nexus

