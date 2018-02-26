<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" indent="no" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <xsl:element name="w">
            <xsl:apply-templates select="//w"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="w">
        <xsl:attribute name="lex">
            <xsl:value-of select="./gram"/>
        </xsl:attribute>
    </xsl:template>
</xsl:stylesheet>