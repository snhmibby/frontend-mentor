#!/bin/bash
# unpack a challenge zip file in challenges/

usage() {
	echo "$0 [install|do] [challenge-name]"
	exit 1
}

if [ ! "$#" -eq 2 ]; then
	usage
fi

challenge="$2"
zip="$challenge-main.zip"

#installed hugo content:
html=layouts/"$challenge.html"
assets=assets/"$challenge/"
content="$challenge.md"

run() {
	vim  "$html" "$assets"/{script.js,style.scss} content/"$content"
}

install() {
	# if solution exists then stop
	if [ -f "$html" ]; then
		echo "challenge $challenge is already installed"
		exit 0;
	fi

	#unzip challenge
	if [ ! -f "$zip" ]; then
		echo Download challenge zip file first...
		usage
	fi
	7z x -y "$zip"

	#make empty files for solution
	mkdir -p ../"$assets"
	touch ../$assets/{script.js,style.scss}

	cd "$challenge-main"

	#install static files
	mkdir -p ../../static/"$challenge"
	for f in *; do
		if [ -d "$f" ]; then
			cp -R "$f" ../../static/"$challenge"
		fi
	done

	#install html
	html=../../"$html"
	echo '{{ define "main" }}' >> "$html"
	echo "TODO REMOVE UNTIL BODY TAGS" >> "$html"
	cat index.html >> "$html"
	echo '{{ end }}' >> "$html"

	#make hugo content
	cd ../..
	hugo new "$content"
}

case "$1" in
	install)
		install
		;;

	run)
		run
		;;

	*)
		usage
		;;

esac
