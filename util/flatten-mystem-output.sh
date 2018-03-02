#!/usr/bin/env python3
import lxml.etree as ET
import re
from sys import argv

mystemOut = ET.parse(argv[1])
xslt = ET.parse("./flatten-mystem-output.xslt")
transform = ET.XSLT(xslt)
flattened = transform(mystemOut, candidate=argv[3])
flattened.write(argv[2], encoding='UTF-8')