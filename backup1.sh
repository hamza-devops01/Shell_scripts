#!/bin/bash

<<readme
This script for backup wih 5 day rotation.

Usages..
./backup1.sh <path of your source> <path of your destination>
readme

function display_usage(){
	echo "Usage: ./backup1.sh <path of your source> <path of your destination> "
}

if [[ $# -eq 0 ]]; then
        display_usage
fi

source_dir=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir=$2

function create_backup {       
        zip -r "${backup_dir}/backup_${timestamp}.zip" "${source_dir}" > /dev/null
        echo " backup generated successfully for ${timestamp}"
}

function perform_rotation {
	backups=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null))
	#echo "${backups[@]}"
	
	if [ "${#backups[@]}" -gt 5 ];then
		echo "Performin backup for 5 days"
		#list slicing/array slicing
		backups_to_remove=("${backups[@]:5}")
		#echo "${backups_to_remove[@]}"
	fi

	for backup in "${backups_to_remove[@]}";
	do
		rm -f ${backup}

	done

}







create_backup
perform_rotation

