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
                                <xsl:apply-templates select="//topic[@name]"/>
                        </body>
                </html>
        </xsl:template>
        <xsl:template match="topic">
                <h2>
                        <xsl:apply-templates select="@name"/>
                </h2>
                <p>
                        <ul>
                                <xsl:apply-templates select="word">
                                        <xsl:sort data-type="number" select="@rank"/>
                                </xsl:apply-templates>
                        </ul>
                </p>
        </xsl:template>
        <xsl:template match="word">
                <li>
                        <span class="word__count">
                                <xsl:apply-templates select="@count"/>
                        </span>
                        <xsl:text>: </xsl:text>
                        <xsl:apply-templates/>
                </li>
        </xsl:template>
</xsl:stylesheet>