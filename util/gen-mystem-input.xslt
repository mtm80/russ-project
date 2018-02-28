<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//u[@resp = '#putin']"/>
    </xsl:template>

<<<<<<< HEAD
    <xsl:template match="w">
=======
    <xsl:template match="u">
>>>>>>> 3aca6b39a527c80501183e9c2369368f88dbcc73
        <xsl:value-of select="concat(., '&#x0a;&#x0a;')"/>
    </xsl:template>
</xsl:stylesheet>
