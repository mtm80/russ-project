#!/usr/bin/env python3
import lxml.etree as ET
import re
from sys import argv

mystemOut = ET.parse("../temp/putin/mystem-output.xml")
xslt = ET.parse("./flatten-mystem-output.xslt")
transform = ET.XSLT(xslt)
flattened = transform(mystemOut)
print(unicode(flattened))
flattened.write("../temp/putin/flat-mystem-output.xml", )

"""
contains = mystemOut.xpath("//w/")
words = mystemOut.xpath('//w/concat(./ana[1]/@lex, "-", ./text())')
words = [w.replace('\n', '').replace(' ', '') for w in words]
words = list(filter(lambda x: len(x) > 0, words))

lemmas = mystemOut.xpath('//w/ana[1]/@lex')
"""