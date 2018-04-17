<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        version="3.0" 
        xmlns="http://www.w3.org/1999/xhtml">
        <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
        <xsl:variable name="doc-report" select="doc('../analysis/topic-docs.xml')"/>
        <xsl:template match="/">
                <html 
                        xmlns="http://www.w3.org/1999/xhtml">
                        <head>
                                <title>Topics</title>
                        </head>
                        <body>
                                <h1>Topics</h1>
                                <xsl:apply-templates select="//topic[@name]" mode="main"/>
                        </body>
                </html>
        </xsl:template>
        <xsl:template match="topic" mode="main">
                <h2>
                        <xsl:value-of select="@name"/>
                </h2>
                <table>
                        <tr>
                                <th>Lemma</th>
                                <th>Overall count</th>
                                <th>Relevance to Putin</th>
                                <th>Relevance to Zhirnovskii</th>
                        </tr>
                        <xsl:apply-templates select="word">
                                <xsl:sort data-type="number" select="@rank"/>
                                <xsl:with-param name="topic-number" select="@id"/>
                        </xsl:apply-templates>
                </table>
        </xsl:template>
        <xsl:template match="word">
                <xsl:param name="topic-number" as="xs:int"/>
                <xsl:variable as="xs:string" name="topic-word" select="."/>
                <tr>
                        <td>
                                <xsl:apply-templates select='$topic-word'/>
                        </td>
                        <td>
                                <xsl:apply-templates select="substring-before(@count, '.')"/>
                        </td>
                        <td>
                                <xsl:apply-templates select="sum($doc-report//doc[candidate='putin']//topic[@num = $topic-number])"/>
                        </td>
                        <td>
                                <xsl:apply-templates select="sum($doc-report//doc[candidate='zhirinovskii']//topic[@num = $topic-number])"/>
                        </td>
                </tr>
        </xsl:template>
</xsl:stylesheet>