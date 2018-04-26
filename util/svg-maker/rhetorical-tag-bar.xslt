<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns:ru="http://ru-rhetoric.obdurodon.org/rr"
        xmlns="http://www.w3.org/2000/svg" version="2.0">
        <xsl:output encoding="UTF-8" indent="yes"/>
        <xsl:variable name="tag-names"  as="document-node(element(deviceMap))" select="doc('../reading-view-helper/rhetorical-map.xml')"/>
        <xsl:key name="nameByTag" match="device" use="@tag"/>
        <xsl:template match="/">
                <xsl:variable name="candidate-dir" select="concat('../../xml/', 'putin/')"/>
                <xsl:variable name="candidate-docs" select="collection($candidate-dir)"/>
                <svg height="600" viewBox="0 0 610 550">
                        <g transform="translate(40 370)">
                                <xsl:variable as="xs:integer" name="max-value" select="40"/>
                                <xsl:variable as="xs:double" name="bar-scale" select="350 div $max-value"/>
                                <xsl:variable as="xs:integer" name="bar-width" select="20"/>
                                <xsl:variable as="xs:double" name="chart-width" select="(1 + count(distinct-values($candidate-docs//ru:*/local-name()))) * $bar-width * 1.7"/>
                                <text x="-30" y="-345" font-size="20">
                                        <xsl:value-of select="$max-value"/>
                                </text>
                                <xsl:for-each-group select="$candidate-docs//ru:*" group-by="local-name()">
                                        <xsl:sort select="count(current-group())" order="descending"/>
                                        <xsl:variable as="xs:double" name="bar-height" select="count(current-group()) * $bar-scale"/>
                                        <text color="black" x="{(position() - 1) * $bar-width * 1.7 + 20}" y="{-$bar-height - 10}" text-anchor="middle">
                                                <xsl:value-of select="count(current-group())"/>
                                        </text>
                                        <rect x="{(position() - 1) * $bar-width * 1.7 + 10}" y="{-$bar-height}" height="{$bar-height}" width="{$bar-width}" fill="blue"/>
                                        <text x="{(position() - 1) * $bar-width * 1.7 + 15}" y="{10}" color="black" transform="rotate(45 {(position() - 1) * $bar-width * 1.7 + 15} 10)">
                                                <xsl:apply-templates select="key('nameByTag', current-grouping-key(), $tag-names)/name"/>
                                                <title>
                                                        <xsl:apply-templates select="key('nameByTag', current-grouping-key(), $tag-names)/short"/>
                                                </title>
                                        </text>
                                </xsl:for-each-group>
                                <line x1="0" y1="0" x2="{$chart-width}" y2="0" stroke="black" stroke-width="2"/>
                                <line x1="0" y1="0" x2="0" y2="-360" stroke="black" stroke-width="2"/>
                        </g>
                </svg>
        </xsl:template>
</xsl:stylesheet>