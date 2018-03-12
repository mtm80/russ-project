#!/usr/bin/env python3
from sys import argv
import lxml.etree as ET

dom = ET.parse(argv[1])
xslt = ET.parse("./gen-mystem-input.xslt")
transform = ET.XSLT(xslt)
newdom = transform(dom)

with open(argv[2], "w") as outfile:
        outfile.write(str(newdom))