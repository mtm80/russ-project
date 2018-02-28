import lxml.etree as ET
import re
from sys import argv

mystemOut = ET.parse("../temp/putin/mystem-output.xml")
xslt = ET.parse("./flatten-mystem-output.xslt")
transform = ET.XSLT(xslt)
analysis = transform(mystemOut)
analysis.text

"""
contains = mystemOut.xpath("//w/")
words = mystemOut.xpath('//w/concat(./ana[1]/@lex, "-", ./text())')
words = [w.replace('\n', '').replace(' ', '') for w in words]
words = list(filter(lambda x: len(x) > 0, words))

lemmas = mystemOut.xpath('//w/ana[1]/@lex')
"""