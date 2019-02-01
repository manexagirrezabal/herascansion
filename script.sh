#!/bin/bash

CORPUSFOLDER=$HOME/corpusak/for_better_for_verse/
CORPUSREADERFOLDER=$HOME/language-technology/poetrycorpusreader/4B4V


#NOTE! REMEMBER "THE TYGER". THERE ARE SOME &s that should be replaced by words
rm corpusFile
touch corpusFile
for file in $CORPUSFOLDER/poems/*.xml
do
	echo "$file";
	python $CORPUSREADERFOLDER/newCorpusReader.py "$file" hunpos >> corpusFile;
done