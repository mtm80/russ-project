#!/usr/bin/env python3
import lxml.etree as ET
import re
from sys import argv

#defines custom namespace with whitespace stripper
def strstrip(context, text):
        return text.strip()

mystemOut = ET.parse(argv[1])
xslt = ET.parse("fulop-svg2.xslt")
transform = ET.XSLT(xslt)
flattened = transform(mystemOut)
flattened.write("demorats.svg", encoding='UTF-8')
