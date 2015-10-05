#! /usr/bin/env bash

set -e -o pipefail

what=$1
name=$2

cd "$(dirname "$BASH_SOURCE")"

git init "repo"

cd "repo"

rm -rf ".git/refs/heads/$name"
rm -rf ".git/refs/tags/$name"

echo "ref: refs/heads/$name" > ".git/HEAD"

while IFS= read i; do
	version=$(echo "$i" | sed -r 's,(.+)-(.+)\.zip,\2,')
	
	ls | parallel rm -r
	unzip -q "../archives/$i"
	
	if [ -d "adblock" ]; then
		mv "adblock/"* .
		rm -r adblock
	fi
	
	git add -A
	git commit -m "Release $version of $what."
	git tag "$name/$version"
done < "../$name.txt"
