#!/bin/bash

case $deleted_ref in
	"main" | "master" )
		echo "::set-output name=deploy_root::/"
		echo "::set-output name=deploy_exclude::branches"
		;;
	*)
		deploy_root=$(echo "$GITHUB_REF" | sed -e 's/\//-/' -e 's/ ~\^:\/\\//g' -e 's/^/branches\//')
		echo "::set-output name=deploy_root::$deploy_root"
		echo "::set-output name=deploy_exclude::"
		;;
esac
