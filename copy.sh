#! /bin/bash

__add_list(){
	local line list=;
	while read line; do
		list=${list}${line},	
	done
	echo $list
	return 0
}

main(){
	#if [ $# -ne 1 ]; then
	#echo "Add 1 path for list file"
	#exit 1
	#fi

	#local fpath=$1
	local fpath=./list/test.list
	local host=xe
	local fileheader=/archive_lngs100TB/xenonnt2/NVeto/NVtests/Run000
	local fileplace=~/xenon/swt/data
	local list=

	list=`cat $fpath | __add_list`
	list=`echo ${list} | rev |cut -c 2- | rev`
	echo "file list"
	echo $list

	echo 	"scp -r -v -C ${host}:${fileheader}\{${list}}\* ${fileplace}"
		`scp -r -v -C ${host}:${fileheader}\{${list}}\* ${fileplace}`

	echo "Copy succeeded"
	return 0
}

main $@
