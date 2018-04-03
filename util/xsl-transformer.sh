#!/usr/bin/env python3
import lxml.etree as ET
import re
from sys import argv

if argv[1] == "-h" or argv[1] == '--help':
        print("./xsl-transformer.sh [input-xsl] [xslt] [output-file]")


inputDom = ET.parse(argv[1])
transform = ET.XSLT(ET.parse(argv[2]))
outputDom = transform(inputDom)
outputDom.write(argv[3], encoding='UTF-8')
