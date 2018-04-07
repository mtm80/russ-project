<?xml version="1.0" encoding="UTF-8"?>
<!-- No @xpath-default-namespace because topic report and TEI input are in different namespaces -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:ru="http://ru-rhetoric.obdurodon.org/rr" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="#all" version="3.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <!-- Strip all whitespace nodes, some of which are recreated when <w> elements are processed -->
    <xsl:strip-space elements="*"/>
    <xsl:variable name="mallet" as="document-node(element(topicModel))"
        select="doc('topic-report-30.xml')"/>
    <!-- Match only topics that have a @name attribute value -->
    <xsl:key name="topicByWord" match="topic[@name]" use="word"/>
    <xsl:key name="nameByRef" match="tei:respStmt/tei:persName | tei:respStmt/tei:name" use="@ref"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Hi, Mom!</title>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </h1>
                <xsl:apply-templates select="//tei:u"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:u">
        <h2>
            <xsl:value-of select="key('nameByRef', @resp)"/>
        </h2>
        <p>
            <!-- pass silently through everything until <w> nodes and plain text -->
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:w" priority="1">
        <xsl:choose>
            <!-- create <span> if there's a topic to be reported -->
            <xsl:when test="count(key('topicByWord', @lemma, $mallet)) gt 0">
                <span class="{string-join(key('topicByWord', @lemma, $mallet)/@name, ' ')}">
                    <xsl:next-match/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:next-match/>
            </xsl:otherwise>
        </xsl:choose>
        <!-- 
                Add space after <w> if the next node is another <w> or text that contains any letters
                That is, do not add a space if the <w> is followed immediately by a text string that does 
                    not contain letters, that is, that contains only white space and punctuation.
                Restores whitespace nodes that were stripped over-aggressively with <xsl:strip-space>
                TODO: There's still an annoying extraneous space at the ends of paragraphs
            -->
        <xsl:if
            test="following-sibling::node()[1][self::tei:w or self::text()[matches(., '\p{L}')]]">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:w">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>
