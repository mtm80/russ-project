<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs"
    version="1.0">
    <xsl:output method="text" encoding="utf-8" omit-xml-declaration="yes"/>
    <xsl:param name="candidate" as="xs:string"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:u"/>
    </xsl:template>
    <xsl:template match="tei:u">
        <xsl:if test="@resp = $candidate">
            <xsl:apply-templates/>
            <xsl:text>Ъ </xsl:text>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
