#!/usr/bin/env python3
import lxml.etree as ET
from sys import argv

#fetch all words in flat-output.xml
word_filename = argv[1]
lemma_data = ET.parse(word_filename)
words = lemma_data.xpath("//w")

#open tei file
tei_filename = argv[2]
tei = ET.parse(tei_filename)

#grab all of the utterances for the given candidate
candidate_tag = argv[3]
tei_namespaces = {"tei": "http://www.tei-c.org/ns/1.0"}
utterances = tei.xpath("//tei:u[@resp = '%s']" % candidate_tag, namespaces=tei_namespaces)

#remove all of each utterance's children
for u in utterances:
        children = u.getchildren()
        u.text = ""

#go thru list of words, inserting into appropriate utterance
i = 0
j = 0
for word in words:
        if (word.text == "?"):
                i += 1
                j = 0
        else:
                utterances[i].insert(j, word)
                j += 1

#write output to /xml folder
tei.write(argv[2] + ".test", encoding="utf-8")