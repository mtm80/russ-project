<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="2.0" 
        xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="text" omit-xml-declaration="yes" disable-output-escaping="yes"/>
    <xsl:template match="//u[@resp='#putin']">
        <xsl:value-of select="."/>
        <xsl:text>
        
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>