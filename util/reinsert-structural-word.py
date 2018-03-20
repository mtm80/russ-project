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

u_text = []

#remove all of each utterance's children
for u in utterances:
        u_text.append(u.text)
        u.text = ""
        
#go thru list of words, inserting into appropriate utterance
utterance_i = 0
word_i = 0
text_i = 0
for word in words:
        if (word.text == "?"):
                utterances[utterance_i].clear()
                print(u_text[utterance_i])
                utterance_i += 1
        else:
                utterances[utterance_i].insert(word_i, word)
                word_i += 1
        word_element = ET.tostring(word, encoding=str)
        found_location = u_text[utterance_i].find(word.text, text_i)
        u_text[utterance_i] = u_text[utterance_i][:text_i] + u_text[utterance_i][text_i:].replace(word.text, word_element, 1)
        text_i = found_location + 1
        

#write output to /xml folder
tei.write(argv[2] + ".test", encoding="utf-8")