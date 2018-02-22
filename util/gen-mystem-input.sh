#!/usr/bin/env python3
from sys import argv
import lxml.etree as ET

dom = ET.parse("../xml/putin/interviu-amerikanskomu-telekanalu-nbc.xml")
xslt = ET.parse("gen-mystem-input.xslt")
transform = ET.XSLT(xslt)
newdom = transform(dom)
print(str(newdom))