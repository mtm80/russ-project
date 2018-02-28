<?xml version="1.0" encoding="UTF-8"?>
<<<<<<< HEAD
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
=======
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--<xsl:output method="xml" encoding="utf-8" indent="yes"/>-->
    <xsl:template match="/">
        <text>
            <xsl:apply-templates select="//w"/>
        </text>
    </xsl:template>
    <xsl:template match="w">
        <xsl:element name="w">
            <xsl:attribute name="lemma">
                <xsl:value-of select="./ana/@lex"/>
            </xsl:attribute>
            <xsl:apply-templates select="./text()"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
>>>>>>> 3aca6b39a527c80501183e9c2369368f88dbcc73
