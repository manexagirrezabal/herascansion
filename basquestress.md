## Basque stress implementation
This implementation requires a lemmatizer and a syllabifier. We have used the lemmatizer included in the [Ixa-pipeline](https://github.com/ixa-ehu/ixa-pipe-pos). We used a syllabification algorithm that relies on the sonority hierarchy and the maximum onset principle.

```python
# -*- coding: utf-8
import sys

import silaba
import ixapipes

def setstress(word, lemma):
#  print "Palabra:"+''.join(word).encode("utf8")
  if len(word)==1: #Monosyllabic word, then [+1] stress
    stress=["'"]
  elif len(lemma)==1: #Word with monosyllabic root or lemma, then [+1] stress
    stress=["'"]+["-"]*(len(word)-1)
  elif len(word)==2:
    stress=["'-"]
  else:
    stress=["-'"]+["-"]*(len(word)-2)
  if len(lemma)>1 and len(word)>3:
    stress[-1]="`"
  return "".join(stress)

def main():
  word=raw_input().decode("utf8").rstrip()
  while word:
    lemma=ixapipes.just_lemma(word)[0]
    print setstress(silaba.word2syllables(word),silaba.word2syllables(lemma))
    word=raw_input().decode("utf8").rstrip()

  #print setstress(['e','txe','ra','ko','an'],['e','txe'])
  #print setstress(['lu','rre','ti','kan'],['lur'])


if __name__== '__main__':
  main()

```
