### The function isheavy()
This function returns 1 if the syllable is heavy and 0 if the syllable is not heavy. It works with a simple heuristic. If the syllable ends in a consonant it will be heavy. If the nucleus of the syllable is a diphthong, it will be heavy too. Otherwise, we will return 0.
```python
diphs=['ae', 'ai', 'au', 'ea', 'ee', 'ei', 'eo', 'eu', 'ia', 'ie', 'io', 'iu', 'oa', 'oe', 'oi', 'oo', 'ou', 'ua', 'ue', 'ui', 'uo']
#Diphthongs calculated using the program diphthong.py
def isheavy(str):
    if str[-1] in 'bcdfghjklmnpqrstvxyz': #If the syllable ends in consonant, it is heavy
        return '1'
    elif re.sub("[^aeiou]","",str) in diphs: #If the nucleus (syllable without consonants) is a diphthong, it is heavy
        return '1'
    else: #Then, if neither of the previous conditions are satisfied, the syllable is light
        return '0'
```

### The program diphthong .py
This program calculates the possible diphthongs in a corpus by using a very simple technique.
```python
# -*- coding:  utf8
import sys
import re

f=open(sys.argv[1])
lines = [re.sub("[^a-z\ ]", "", line.decode("utf8").rstrip().lower()) for line in f]
f.close()

def removeChars (w):
  return re.sub("[^aeiou]", "", w)

nuclei=[]
for line in lines:
  nuclei=nuclei+re.split("[^aeiou]", line)

sortedset=sorted([i for i in list(set(nuclei)) if (len(i)<3 and len(i)>1)])

print sortedset
print ','.join(sortedset)
```
