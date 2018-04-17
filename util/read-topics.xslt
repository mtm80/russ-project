<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        version="3.0" 
        xmlns="http://www.w3.org/1999/xhtml">
        <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
        <xsl:variable name="pdocs" select="collection('../xml/putin')"/>
        <xsl:variable name="zdocs" select="collection('../xml/zhirinovskii')"/>
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
                        <xsl:value-of select="@name"/>
                </h2>
                <table>
                        <xsl:apply-templates select="word">
                                <xsl:sort data-type="number" select="@rank"/>
                        </xsl:apply-templates>
                </table>
        </xsl:template>
        <xsl:template match="word">
                <xsl:variable as="xs:string" name="topic-word" select="."/>
                <tr>
                        <td>
                                <xsl:apply-templates select='$topic-word'/>
                        </td>
                        <td>
                                <xsl:apply-templates select="substring-before(@count, '.')"/>
                        </td>
                        <td>
                                <xsl:apply-templates select="count($pdocs//tei:w[@lemma = $topic-word])"/>
                        </td>
                        <td>
                                <xsl:apply-templates select="count($zdocs//tei:w[@lemma = $topic-word])"/>
                        </td>
                </tr>
        </xsl:template>
</xsl:stylesheet>