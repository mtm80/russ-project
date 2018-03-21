<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" 
        xmlns="http://www.w3.org/1999/xhtml">
        <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
        <xsl:template match="/">
                <html 
                        xmlns="http://www.w3.org/1999/xhtml">
                        <head>
                                <title>
                                        <xsl:apply-templates select="//titleStmt/title"/>
                                </title>
                        </head>
                        <body>
                                <h1>
                                        <xsl:apply-templates select="//titleStmt/title"/>
                                </h1>
                                <xsl:apply-templates select="//u"/>
                        </body>
                </html>
        </xsl:template>
        <xsl:template match="u">
                <b>
                        <xsl:apply-templates select="@resp"/>
                </b>
                <xsl:text>: </xsl:text>
                <xsl:apply-templates/>
        </xsl:template>
</xsl:stylesheet>