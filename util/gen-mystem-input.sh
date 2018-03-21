#!/usr/bin/env python3
from sys import argv
import lxml.etree as ET

dom = ET.parse(argv[1])
transform = ET.XSLT(ET.parse("gen-mystem-input.xslt"))
#candidate_path = ET.XPath("@resp = %s" % argv[3], namespaces={"tei": "http://www.tei-c.org/ns/1.0"})
newdom = transform(dom, candidate="'%s'" % argv[3])

with open(argv[2], "w") as outfile:
        outfile.write(str(newdom))