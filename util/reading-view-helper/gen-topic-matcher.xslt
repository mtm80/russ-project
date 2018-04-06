<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:axsl="http://www.w3.org/1999/XSL/TransformAlias"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:namespace-alias stylesheet-prefix="axsl" result-prefix="xsl"/>
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:variable name="money-sign" as="xs:string">$</xsl:variable>
    <xsl:template match="/">
        <axsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
            <axsl:function name="topic-match" as="xs:string">
                <axsl:param name="lemma" as="xs:string"/>
                <axsl:choose>
                    <xsl:apply-templates select="//topic[boolean(@name)]"/>
                </axsl:choose>
            </axsl:function>
        </axsl:stylesheet>
    </xsl:template>
    <xsl:template match="topic">
        <axsl:when test="&#36;lemma = ({string-join(word/string(), ', ')})">
            <xsl:value-of select="@name"/>
        </axsl:when>
    </xsl:template>
</xsl:stylesheet>