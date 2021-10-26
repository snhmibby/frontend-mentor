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
cdir="frontend-challenges"

#installed hugo content:
html=layouts/frontend-mentor/"$challenge/list.html"
assets=assets/frontend-mentor/"$challenge/"
content=frontend-mentor/"$challenge/_index.md"

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
	cd $cdir
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
	mkdir -p ../../static/frontend-mentor/"$challenge"
	for f in *; do
		if [ -d "$f" ]; then
			cp -R "$f" ../../static/frontend-mentor/"$challenge"
		fi
	done

	#install html
	html=../../"$html"
	mkdir -p "../../layouts/frontend-mentor/$challenge"
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
