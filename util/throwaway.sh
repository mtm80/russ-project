#!/usr/bin/env python3
import lxml.etree as ET
import re
from sys import argv

oddfile = ET.parse("../odd/speeches.odd")
xslt = ET.parse("./throwaway.xslt")
transform = ET.XSLT(xslt)
transformed = transform(oddfile)
transformed.write("../temp/homebrew.xhtml")

"""
contains = mystemOut.xpath("//w/")
words = mystemOut.xpath('//w/concat(./ana[1]/@lex, "-", ./text())')
words = [w.replace('\n', '').replace(' ', '') for w in words]
words = list(filter(lambda x: len(x) > 0, words))

lemmas = mystemOut.xpath('//w/ana[1]/@lex')
"""