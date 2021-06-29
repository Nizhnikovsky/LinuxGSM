#!/bin/bash

ostype="$(awk -F "=" '/^NAME/ {gsub("\"","");print $2}' /etc/os-release)"

if [[ "$ostype" == "Ubuntu" ]]; then
    sudo dpkg --ad-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat openjdk-16-jre
fi

if [ ${ostype}  == "CentOS" ]; then
	yum install epel-release
	yum install curl wget tar bzip2 gzip unzip python3 binutils bc jq tmux glibc.i686 libstdc++ libstdc++.i686
fi

if [ ${ostype}  == "Debian" ]; then
    sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6
fi
