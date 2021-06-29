#!/bin/bash

rootdir=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
serverconfigfile="server.properties"
serverfiles="${rootdir}/serverfiles"
configdirserver="${serverfiles}/${serverconfigfile}"

fn_set_server_configs()
{
	file_field=${1}
	variable=${2}

	 case ${file_field} in
      server_ip)
      	sed  -i -e "s/\(^server-ip=\).*/\1${variable}/" $configdirserver
      	shift
      	;;
      server_name)
      	sed  -i -e "s/\(^motd=\).*/\1${variable}/" $configdirserver
      	shift
      	;;
   esac
   shift
}


while [ $# -gt 0 ]; do
   case "$1" in
      --server_ip)
      	fn_set_server_configs "server_ip" "${2}"
      	shift
      	;;
      --server_name)
      	fn_set_server_configs "server_name" "${2}"
      	shift
      	;;
   esac
   shift
done
