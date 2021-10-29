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
zip="$challenge.zip"

#installed hugo content:
hugodir="`pwd`/.." #assume script lives in hugo-site/exercises and is invoked from there
html=layouts/_default/"$challenge.html"
assets=assets/"$challenge/"
content="$challenge.md"


if [ -e "$hugodir/static/$challenge" ]; then
	echo "already installed?"
	#exit 1
fi

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
	mkdir -p "$hugodir/$assets"
	touch "$hugodir/$assets/"{script.js,style.scss}

	cd "$challenge"

	#install static files
	mkdir -p "$hugodir/static/$challenge"
	for f in *; do
		if [ -d "$f" ]; then
			cp -R "$f" "$hugodir/static/$challenge"
		fi
	done

	#install index.html
	tmphtml="$hugodir/$html"
	echo '{{ define "main" }}' > "$tmphtml"
	echo "TODO REMOVE UNTIL BODY TAGS" >> "$tmphtml"
	cat index.html >> "$tmphtml"
	echo '{{ end }}' >> "$tmphtml"

	#make hugo content
	cd $hugodir && hugo new "$content"
}

install

#make a directory to hold symlinks to all related files
solutionDir="$hugodir/static/$challenge/solution"
mkdir -p $solutionDir
ln -s "$hugodir/$assets"/* "$solutionDir"/.
ln -s "$hugodir/$html" "$solutionDir/$challenge".html


