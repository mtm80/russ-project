<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
        xmlns="http://www.w3.org/1999/xhtml">
        <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
        <xsl:template match="/">
                <html 
                        xmlns="http://www.w3.org/1999/xhtml">
                        <head>
                                <title>Topics</title>
                        </head>
                        <body>
                                <h1>Topics</h1>
                                <xsl:call-template name="topic">
                                        <xsl:with-param name="topic-name" select="distinct-values(//topic/@name)"/>
                                </xsl:call-template>
                        </body>
                </html>
        </xsl:template>
        <xsl:template name="topic">
                <xsl:param name="topic-name" as="xs:string"/>
                <h2>
                        <xsl:value-of select="$topic-name"/>
                </h2>
                <p>
                        <ul>
                                <xsl:apply-templates select="//topic[@name = '$topic-name']/word">
                                        <xsl:sort data-type="number" select="@rank"/>
                                </xsl:apply-templates>
                        </ul>
                </p>
        </xsl:template>
        <xsl:template match="word">
                <li>
                        <xsl:apply-templates/>
                        <span class="word__count">
                                <xsl:text> occurs </xsl:text>
                                <xsl:apply-templates select="@count"/>
                                <xsl:text> times</xsl:text>
                        </span>
                </li>
        </xsl:template>
</xsl:stylesheet>