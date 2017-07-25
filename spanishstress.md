
## Spanish stress implementation
This implementation requires a lemmatizer and a syllabifier. We have used the lemmatizer included in the [Ixa-pipeline](https://github.com/ixa-ehu/ixa-pipe-pos). We modified the syllabification algorithm that relies on the sonority hierarchy and the maximum onset principle in order to syllabify words in Spanish.

```python
# -*- coding: utf-8

tildes="áéíóú".decode("utf8")
nsv="aeiouns".decode("utf8")

def hastilde(st):
  return sum([i in tildes for i in st])>0
def hasnsv(st):
  return sum([i in nsv for i in st])>0

def setstress(word):
#  print "Palabra:"+''.join(word).encode("utf8")
  if len(word)==1 and hastilde(word[0]):
    stress=['+']
  elif len(word)==1:
    stress=['?']
  else:
    stress=["-"]*len(word)
    acentuado=[hastilde(i) for i in word]
    if sum(acentuado)>0:
      stress[acentuado.index(True)]="+"
    else:
      lastchar=word[-1][-1]
      if lastchar in nsv:
        stress[-2]="+"
      else:
        stress[-1]="+"
  #print "Acento:"+''.join(stress)
  return stress

print setstress(["úl".decode("utf8"),"ti","mo"])
```
