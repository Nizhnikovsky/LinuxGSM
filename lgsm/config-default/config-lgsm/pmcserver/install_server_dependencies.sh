#!/bin/bash

ostype=awk -F "=" '/^NAME/ {print $2}' /etc/os-release
echo "${ostype}"
#sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat default-jre
