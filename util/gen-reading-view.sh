#!/usr/bin/env python3
from sys import argv
import lxml.etree as ET

dom = ET.parse(argv[1])
transform = ET.XSLT(ET.parse("gen-reading-view.xslt"))
newdom = transform(dom)

with open(argv[2], "w") as outfile:
        outfile.write(str(newdom))