<?xml version="1.0" encoding="UTF-8"?>
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
