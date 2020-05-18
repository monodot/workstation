#!/bin/sh

FEDORA_VERSION=29

# Albert launcher
sudo rpm --import \
	https://build.opensuse.org/projects/home:manuelschneid3r/public_key
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_${FEDORA_VERSION}/home:manuelschneid3r.repo
sudo dnf install albert

