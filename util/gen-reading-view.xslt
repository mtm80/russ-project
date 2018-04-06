<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns:ru="http://ru-rhetoric.obdurodon.org/rr"
        xmlns:mf="http://ru-rhetoric.obdurodon.org/mf"
        version="3.0" 
        xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="tei mf">
        <xsl:output method="xml" indent="yes" encoding="UTF-8" doctype-system="about:legacy-compat"/>
        <xsl:template match="/">
                <html 
                        xmlns="http://www.w3.org/1999/xhtml">
                        <head>
                                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                                <title>
                                        <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                                </title>
                                <script src="../obdurodon/js/reading.js"></script>
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
                                        <xsl:for-each select="distinct-values(//*[self::ru:*]/local-name())">
                                                <xsl:call-template name="rhetorical-button">
                                                        <xsl:with-param name="device-name" select="."/>
                                                </xsl:call-template>
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
                        <xsl:variable as="xs:string" name="resp" select="@resp"/>
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
        <xsl:template name="rhetorical-button">
                <xsl:param name="device-name" as="xs:string"/>
                <input id="{$device-name}-selector" type="radio" name="device" value="{$device-name}"/>
                <label for="{$device-name}-selector">
                        <xsl:value-of select="$device-name"/>
                </label>
                <br/>
        </xsl:template>
</xsl:stylesheet>