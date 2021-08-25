#!/bin/bash

DEST=../lucproglangcourse.github.io

rm -rf $DEST/*
touch $DEST/.nojekyll
mkdir -p $DEST/download
cp -a build/html/* $DEST/
cp build/latex/*.pdf $DEST/download/
cp build/epub/*.epub $DEST/download/proglang.epub

git log main --pretty=short --abbrev-commit > $DEST/COMMITS.txt

pushd $DEST
git add -A
git commit -m "Generated site for `git log main -1 --pretty=short --abbrev-commit`" && git push
popd
