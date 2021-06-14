#!/bin/bash

case $GITHUB_REF in
	"heads/refs/main" | "heads/refs/master" )
		echo "::set-output name=deploy_root::/"
		;;
	*)
		deploy_root=$(echo "$GITHUB_REF" | sed -e 's/heads\/refs\///' -e 's/\//-/' -e 's/ ~\^:\/\\//g' -e 's/^/branches\//')
		echo "::set-output name=deploy_root::$deploy_root"
		;;
esac
