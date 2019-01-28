#!/bin/bash

CORPUSFOLDER=$HOME/corpusak/for_better_for_verse/
CORPUSREADERFOLDER=$HOME/language-technology/poetrycorpusreader/4B4V

rm corpusFile
touch corpusFile
for file in $CORPUSFOLDER/poems/*.xml
do
	echo "$file";
	python $CORPUSREADERFOLDER/newCorpusReader.py "$file" hunpos >> corpusFile;
done