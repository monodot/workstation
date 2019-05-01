#!/bin/sh

if [ -f ~/.m2/settings.xml ]; then
	mv ~/.m2/settings.xml ~/.m2/settings.xml.bak
fi

ln -s $(pwd)/settings-mirror.xml ~/.m2/settings.xml
ln -s $(pwd)/settings-redhat.xml ~/.m2/settings-redhat.xml

