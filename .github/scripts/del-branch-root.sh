#!/bin/bash

case $deleted_ref in
	"main" | "master" )
		echo "deploy_root=/" >> "$GITHUB_OUTPUT"
		echo "deploy_exclude=branches" >> "$GITHUB_OUTPUT"
		;;
	*)
		deploy_root=$(echo "$GITHUB_REF" | iconv -t ascii//TRANSLIT | sed -e 's/refs\/heads\///' -e 's/\//-/g' -e 's/ ~\^:\/\\//g' -e 's/[^a-zA-Z0-9]+/-/g' -e 's/^-+\|-+$//g' -e 's/^/branches\//' | tr A-Z a-z)
		echo "deploy_root=$deploy_root" >> "$GITHUB_OUTPUT"
		echo "deploy_exclude=" >> "$GITHUB_OUTPUT"
		;;
esac
