#!/bin/bash

case $GITHUB_REF in
	"refs/heads/main" | "refs/heads/master" )
		echo "::set-output name=deploy_root::/"
		echo "::set-output name=deploy_exclude::branches"
		;;
	*)
		deploy_root=$(echo "$GITHUB_REF" | sed -e 's/refs\/heads\///' -e 's/\//-/' -e 's/ ~\^:\/\\//g' -e 's/^/branches\//')
		echo "::set-output name=deploy_root::$deploy_root"
		echo "::set-output name=deploy_exclude::"
		;;
esac
