<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns:ru="http://ru-rhetoric.obdurodon.org/rr"
        version="3.0" 
        xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="tei">
        <xsl:output method="xml" indent="yes" encoding="UTF-8" doctype-system="about:legacy-compat"/>
        <xsl:variable name="mallet" as="document-node(element(topicModel))"
                select="doc('topic-report-30.xml')"/>
        <!-- Match only topics that have a @name attribute value -->
        <xsl:key name="topicByWord" match="topic[@name]" use="word"/>
        <xsl:key name="nameByRef" match="tei:respStmt/tei:persName | tei:respStmt/tei:name" use="@ref"/>
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
                        <xsl:value-of select="key('nameByRef', @resp)"/>
                </h2>
                <p>
                        <xsl:apply-templates/>
                </p>
        </xsl:template>
        <xsl:template match="tei:w">
                <xsl:variable name="word_topics" as="element(topic)*"
                        select="key('topicByWord', @lemma, $mallet)"/>
                <xsl:choose>
                        <!-- 
                create <span> if there's a topic to be reported
                replace spaces in @name values with underscores, so that they can be used as @class values
                remove duplicates, since multiple topics share the same @name value
            -->
                        <xsl:when test="count($word_topics) gt 0">
                                <span
                                        class="{$word_topics/translate(@name, ' ', '_')
                                        => distinct-values()
                                        => string-join(' ')}">
                                        <xsl:apply-templates/>
                                </span>
                        </xsl:when>
                        <xsl:otherwise>
                                <xsl:apply-templates/>
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
