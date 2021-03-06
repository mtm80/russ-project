<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes" encoding="utf-8"/>
    <xsl:strip-space elements="w"  />
    <xsl:template match="/">
        <words>
            <xsl:apply-templates select="//se"/>
        </words>
    </xsl:template>
    <xsl:template match="se">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="w">
        <xsl:element name="w">
            <xsl:attribute name="lemma">
                <xsl:apply-templates select="ana[1]/@lex"/>
            </xsl:attribute>
            <xsl:apply-templates select="text()"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>