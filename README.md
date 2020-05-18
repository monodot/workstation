# workstation

Stuff for my MacBook or Fedora.

## Jenkins

To start Jenkins in a Docker container:

    ./jenkins/start-jenkins.sh

## Maven

Included in `maven/` are example `settings.xml` files to use.

## Nexus 2

- Start Nexus in a Docker container - `./nexus2/start-nexus.sh`

## Nexus 3

To run Nexus 3 in a container:

    sudo mkdir -p /opt/nexus3/nexus-data
    sudo chown -R tdonohue:tdonohue /opt/nexus3
    ./nexus3/start-nexus.sh

