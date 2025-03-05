#!/bin/bash

case $GITHUB_REF in
	"refs/heads/main" | "refs/heads/master" )
		echo "deploy_root=/" >> "$GITHUB_OUTPUT"
		echo "deploy_exclude=branches" >> "$GITHUB_OUTPUT"
		echo "deploy_baseurl=" >> "$GITHUB_OUTPUT"
		;;
	*)
		deploy_root=$(echo "$GITHUB_REF" | iconv -t ascii//TRANSLIT | sed -e 's/refs\/heads\///' -e 's/\//-/g' -e 's/ ~\^:\/\\//g' -e 's/[^a-zA-Z0-9]+/-/g' -e 's/^-+\|-+$//g' -e 's/^/branches\//' | tr A-Z a-z)
		echo "deploy_root=$deploy_root" >> "$GITHUB_OUTPUT"
		echo "deploy_exclude=" >> "$GITHUB_OUTPUT"
		echo "deploy_baseurl=$deploy_root" >> "$GITHUB_OUTPUT"
		;;
esac
