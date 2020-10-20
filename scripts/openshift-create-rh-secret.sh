#!/bin/bash

echo -n Username:
read username

echo -n Password:
read -s password

oc create secret docker-registry redhat-registry-secret \
--docker-username=${username} \
--docker-password=${password} \
--docker-server=registry.redhat.io

oc secrets link deployer redhat-registry-secret

oc secrets link builder redhat-registry-secret --for=pull

