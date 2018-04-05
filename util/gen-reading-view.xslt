<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns:ru="http://ru-rhetoric.obdurodon.org/rr" version="3.0" 
        xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="tei">
        <xsl:output method="xml" indent="yes" encoding="UTF-8" doctype-system="about:legacy-compat"/>
        <xsl:template match="/">
                <html 
                        xmlns="http://www.w3.org/1999/xhtml">
                        <head>
                                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                                <title>
                                        <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                                </title>
                                <style>                                        /*.lemma{                                                visibility: collapse;                                        }*/                                        /*                                        .word{                                                font-weight: bold;                                        }*/                                </style>
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
                                                <xsl:apply-templates mode="form" select="//ru:actorDesc | //ru:authority | //ru:anecdote | //ru:cat | //ru:consensus | //ru:disclaimer | //ru:evidence | //ru:hyperbole | //ru:implication | //ru:irony | //ru:lex | //ru:glory | //ru:stats | //ru:promise | //ru:polarization | //ru:assumption | //ru:vague | //ru:victim | //ru:conclusion"/>
                                        </form>
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
                <a class="word" id="word-{generate-id(.)}">
                        <xsl:apply-templates/>
                </a>
                <!--
                <span class="lemma" id="lemma-{generate-id(.)}"><xsl:text>(</xsl:text><xsl:value-of select="@lex"/><xsl:text>)</xsl:text></span>-->
        </xsl:template>
</xsl:stylesheet>