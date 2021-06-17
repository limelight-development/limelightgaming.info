#!/bin/bash

case $GITHUB_REF in
	"refs/heads/main" | "refs/heads/master" )
		echo "::set-output name=deploy_root::/"
		echo "::set-output name=deploy_exclude::branches"
		echo "::set-output name=deploy_baseurl::"
		;;
	*)
		deploy_root=$(echo "$GITHUB_REF" | sed -e 's/refs\/heads\///' -e 's/\//-/' -e 's/ ~\^:\/\\//g' -e 's/^/branches\//')
		echo "::set-output name=deploy_root::$deploy_root"
		echo "::set-output name=deploy_exclude::"
		echo "::set-output name=deploy_baseurl::$deploy_root"
		;;
esac
