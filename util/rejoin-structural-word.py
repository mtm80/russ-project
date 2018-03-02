import lxml.etree as ET
import re
from sys import argv

mystemOut = ET.parse("../temp/putin/mystem-output.xml")
xslt = ET.parse("./flatten-mystem-output.xslt")
transform = ET.XSLT(xslt)
analysis = transform(mystemOut)
analysis.write("../temp/putin/flat-mystem-output.xml")

tei = ET.parse("../xml/putin/interviu-amerikanskomu-telekanalu-nbc.xml")
utterances = tei.xpath("//u/")
analysis.xpath("//w")
for u in utterances:
        #find number of words in the utterance, fast forward 
        #to the last word in every utterance, remove all text,
        #then inject all the <w> tags up to that  
        u.xpath("./text()")