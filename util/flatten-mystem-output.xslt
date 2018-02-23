<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="no"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//w"/>
    </xsl:template>
    <xsl:template match="w">
         <xsl:value-of select="concat('<w lemma=\"', ./ana/@lex, '\">', ./text()[1])"/>
    </xsl:template>
</xsl:stylesheet>
