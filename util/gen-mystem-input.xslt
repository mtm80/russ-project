<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs"
    version="1.0">
    <xsl:output method="text" encoding="utf-8" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <!--<xsl:param name="candidate" />-->
        <xsl:apply-templates select="//u[@resp = '#zhirinovskii']"/>
    </xsl:template>
    <xsl:template match="u">
        <xsl:value-of select="concat(., '&#x0a;&#x0a;')"/>
    </xsl:template>
</xsl:stylesheet>
