<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns="http://www.w3.org/1999/xhtml"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="3.0"
        xpath-default-namespace="http://www.tei-c.org/ns/1.0">
        <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
        <xsl:template match="/">
                <html xmlns="http://www.w3.org/1999/xhtml">
                        <head>
                                <title>Homebrew Elements</title>
                        </head>
                        <body>
                                <ul>
                                        <xsl:apply-templates select="//elementSpec"/>
                                </ul>
                        </body>
                </html>
        </xsl:template>
        <xsl:template match="elementSpec">
                <li>
                        <!--<em>
                                <xsl:apply-templates select="@ident"/>
                        </em>
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates select="desc"/>-->
                </li>
        </xsl:template>
</xsl:stylesheet>