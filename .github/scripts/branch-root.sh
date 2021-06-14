#!/bin/bash

case $GITHUB_REF in
	"heads/refs/main" | "heads/refs/master" )
		echo -n "/"
		;;
	*)
		echo -n "$GITHUB_REF" | sed -e 's/heads\/refs\///' -e 's/\//-/' -e 's/ ~\^:\/\\//g' -e 's/^/branches\//'
		;;
esac
