#!/bin/bash
# unpack a challenge zip file in challenges/

usage() {
	echo "$0 [challenge-name]"
	exit 1
}

if [ ! "$#" -eq 1 ]; then
	usage
fi


challenge="$1"
zip="$challenge-main.zip"

if [ -e ../static/"$challenge" ]; then
	echo "already installed?"
	exit 1
fi

#installed hugo content:
html=layouts/_default/"$challenge.html"
assets=assets/"$challenge/"
content="$challenge.md"

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

install
solution

#make a directory to hold symlinks to all related files
solutionDir="static/$challenge/solution"
mkdir -p $solutionDir
ln -s "$assets"/* "$solutionDir"/.
ln -s "$html" "$solutionDir"/"$challenge".html


