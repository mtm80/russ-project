#!/usr/bin/env python3
from sys import argv
import lxml.etree as ET

dom = ET.parse(argv[1])
xslt = ET.parse("./gen-mystem-input.xslt")
transform = ET.XSLT(xslt)
newdom = transform(dom)
print(ET.tostring(newdom, pretty_print=True))
newdom.write(argv[2], encoding='UTF-8')