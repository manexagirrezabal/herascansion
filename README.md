# Herascansion
In this project we make the first steps toward understanding typological differences of English, Spanish and Basque poetic rhythm with the aim of creating a language independent scansion system.


# Dataset
  - [English](english.md)
  - [Spanish](spanish.md)
  - [Basque](https://bitbucket.org/manexagirrezabal/basquepoetrycorpus/src)
  
We will soon release some specific scripts to read these corpora.

# Features
There are specific implementations to get some necessary features, such as:
  - [isheavy](isheavy.md): This function returns true if the syllable is heavy or not according to a heuristic.
  - Lexical stress: We have implemented functions to get the lexical stress for each language.
    - English: We are using the NETTalk dictionary and if the word is not in the vocabulary, we use an SVM-based model
    - [Spanish](spanishstress.md): We have an implementation that encodes the grammatical rules of Spanish stress.
    - [Basque](basquestress.md): We have an implementation that encodes the grammatical rules of standard Basque stress.
 - Part-of-speech tags: We have used pretrained models for POS-tagging.
    - English: [Hidden Markov Models](https://code.google.com/archive/p/hunpos/) trained on the WSJ section of the Penn Treebank corpus
    - Spanish: [Ixa-pipes](https://github.com/ixa-ehu/ixa-pipe-pos) trained on the Ancora corpus
    - Basque: [Ixa-pipes](https://github.com/ixa-ehu/ixa-pipe-pos) trained on the Universal Dependencies corpus
 - In the English corpus syllables are divided. In the Spanish and Basque corpora, as words are not syllabified, we are using a syllabification algorithm based on the sonority hierarchy and maximum onset principle.
# Techniques
### Rule-based methods
  - [ZeuScansion](https://github.com/manexagirrezabal/zeuscansion)
  - [Scandroid](http://oak.conncoll.edu/cohar/Programs.htm)
### Data-driven methods
  - [Averaged Perceptron](https://bitbucket.org/mhulden/pyperceptron)
  - [Hidden Markov Models](https://code.google.com/archive/p/hunpos/)
  - [Conditional Random Fields](http://www.chokkan.org/software/crfsuite/) and a wrapper for [Python](https://github.com/jakevdp/pyCRFsuite)
  - [Double Bi-LSTM + CRF](https://github.com/glample/tagger)
  - Encoder-Decoder architecture (machine_translation example at [blocks-examples](https://github.com/mila-udem/blocks-examples))
  - RNNLM ([char-rnn](https://github.com/karpathy/char-rnn/), or currently, [torch-rnn](https://github.com/jcjohnson/torch-rnn) should be used)


License
----
Creative Commons v. 3.0
