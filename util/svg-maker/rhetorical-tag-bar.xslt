<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns:ru="http://ru-rhetoric.obdurodon.org/rr"
        xmlns="http://www.w3.org/2000/svg" version="2.0">
        <xsl:output encoding="UTF-8" indent="yes"/>
        <xsl:template match="/">
                <xsl:variable name="candidate-dir" select="concat('../../xml/', 'putin/')"/>
                <xsl:variable name="candidate-docs" select="collection($candidate-dir)"/>
                <svg height="500">
                        <g transform="translate(40 370)">
                                <xsl:variable as="xs:integer" name="max-value" select="40"/>
                                <xsl:variable as="xs:double" name="bar-scale" select="350 div $max-value"/>
                                <xsl:variable as="xs:integer" name="bar-width" select="15"/>
                                <text x="-30" y="-345" font-size="20">
                                        <xsl:value-of select="$max-value"/>
                                </text>
                                <xsl:for-each-group select="$candidate-docs//ru:*" group-by="local-name()">
                                        <xsl:sort select="count(current-group())" order="descending"/>
                                        <xsl:variable as="xs:double" name="bar-height" select="count(current-group()) * $bar-scale"/>
                                        <xsl:value-of select="count(current-group())"/>
                                        <rect x="{position() * $bar-width * 2 - 15}" y="{-$bar-height}" height="{$bar-height}" width="{$bar-width + 5}" fill="blue"/>
                                        <text x="{position() * $bar-width * 2 - 10}" y="{10}" color="black" transform="rotate(45 {position() * $bar-width * 2 - 10} 10)">
                                                <xsl:value-of select="current-grouping-key()"/>
                                        </text>
                                </xsl:for-each-group>
                                <line x1="0" y1="0" x2="350" y2="0" stroke="black" stroke-width="2"/>
                                <line x1="0" y1="0" x2="0" y2="-360" stroke="black" stroke-width="2"/>
                        </g>
                </svg>
        </xsl:template>
</xsl:stylesheet>