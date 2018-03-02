<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="no" indent="no" encoding="utf-8"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//u[@resp = $candidate]"/>
    </xsl:template>
    <xsl:template match="u">
        <xsl:value-of select="concat(., '&#x0a;&#x0a;')"/>
    </xsl:template>
</xsl:stylesheet>
