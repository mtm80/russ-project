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
                <html xmlns="http://www.w3.org/1999/xhtml">
                        <head>
                                <title>Topics</title>
                        </head>
                        <body>
                                <h1>Topics</h1>
                                <xsl:variable select="$doc-report//doc[@candidate='putin']" name="putin-docs"/>
                                <xsl:variable select="$doc-report//doc[@candidate='zhirinovskii']" name="zhirinovskii-docs"/>
                                <xsl:variable select="//topic[@name]/@id" name="named-topic-ids"/>
                                <xsl:variable select="1.0 div sum($putin-docs//topic[@num = $named-topic-ids])" name="putin-norm"/>
                                <xsl:variable select="1.0 div sum($zhirinovskii-docs//topic[@num = $named-topic-ids])" name="zhirinovskii-norm"/>
                                <xsl:for-each-group select="//topic[@name]" group-by="@name">
                                        
                                        <h2>
                                                <xsl:value-of select="@name"/>
                                        </h2>
                                        <table>
                                                <tr>
                                                        <th>Relevance to Putin</th>
                                                        <td><xsl:apply-templates select="$putin-norm * sum($putin-docs//topic[@num = current-group()/@id])"/></td>
                                                </tr>
                                                <tr>
                                                        <th>Relevance to Zhirinovskii</th>
                                                        <td><xsl:apply-templates select="$zhirinovskii-norm * sum($zhirinovskii-docs//topic[@num = current-group()/@id])"/></td>
                                                </tr>
                                                <tr>
                                                        <th>Lemma</th>
                                                        <th>Overall count</th>
                                                </tr>
                                                <xsl:apply-templates select="current-group()/word">
                                                        <xsl:sort data-type="number" select="@count"/>
                                                </xsl:apply-templates>
                                                
                                        </table>
                                </xsl:for-each-group>
                        </body>
                </html>
        </xsl:template>
        <xsl:template match="word">
                <tr>
                        <td>
                                <xsl:apply-templates/>
                        </td>
                        <td>
                                <xsl:apply-templates select="substring-before(@count, '.')"/>
                        </td>
                </tr>
        </xsl:template>
</xsl:stylesheet>