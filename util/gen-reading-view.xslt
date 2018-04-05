<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns:ru="http://ru-rhetoric.obdurodon.org/rr"
        xmlns:mf="http://ru-rhetoric.obdurodon.org/mf"
        version="3.0" 
        xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="tei">
        <xsl:output method="xml" indent="yes" encoding="UTF-8" doctype-system="about:legacy-compat"/>
        <xsl:function name="rhetorical-button">
                <xsl:param name="device-name" as="xs:string"/>
                <input id="{local-name(.)}-selector" type="radio" name="device" value="{local-name(.)}"/>
                <label for="{local-name(.)}-selector">
                        <xsl:value-of select="local-name(.)"/>
                </label>
                <br/>
        </xsl:function>
        <xsl:template match="/">
                <html 
                        xmlns="http://www.w3.org/1999/xhtml">
                        <head>
                                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                                <title>
                                        <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                                </title>
                        </head>
                        <body>
                                <div id="speech-text">
                                        <h1>
                                                <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                                        </h1>
                                        <xsl:apply-templates select="//tei:u"/>
                                </div>
                                <div id="sidebar">
                                        <h2>
                                                Rhetorical devices:
                                        </h2>
                                        <form>
                                                <!--Matches all of the rhetorical device tags, creating a form for all of them-->
                                                <!--
                                                <xsl:for-each select="distinct-values(//*[self::ru:*]/local-name())">
                                                        <xsl:apply-templates select="mf:rhetorical-button(.)"/>
                                                </xsl:for-each>-->
                                        </form>
                                        <h2>
                                                Topics:
                                                <!--here we might want to use some sort of import feature to get the topics + lemmas as a function-->
                                        </h2>
                                </div>
                        </body>
                </html>
        </xsl:template>
        <xsl:template match="tei:u">
                <h2>
                        <xsl:variable as="string" name="resp" select="@resp"/>
                        <xsl:apply-templates select="//tei:titleStmt/tei:respStmt/tei:persName[@ref = $resp]"/>
                        <xsl:text>: </xsl:text>
                </h2>
                <p>
                        <xsl:apply-templates/>
                </p>
        </xsl:template>
        <xsl:template match="tei:w">
                <span class="word" id="word-{generate-id(.)}">
                        <xsl:apply-templates/>
                </span>
        </xsl:template>
        <xsl:template match="ru:*">
                <span class="rhetoric__{local-name(.)}">
                        <xsl:apply-templates/>
                </span>
        </xsl:template>
</xsl:stylesheet>