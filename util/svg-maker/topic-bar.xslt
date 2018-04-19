<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns="http://www.w3.org/2000/svg" version="2.0">
        <xsl:template match="/">
                <xsl:variable name="desc-doc" select="doc('../../analysis/topic-report.xslt')"/>
                <svg height="400">
                        <g transform="translate(30 370)">
                                <xsl:variable as="xs:integer" name="bar-scale" select="3"/>
                                <xsl:variable as="xs:integer" name="bar-width" select="15"/>
                                <line x1="0" y1="0" x2="400" y2="0" stroke="black" stroke-width="2"/>
                                <line x1="0" y1="-50" x2="400" y2="-50" stroke="gray" stroke-width="1"/>
                                <line x1="0" y1="0" x2="0" y2="-100" stroke="black" stroke-width="2"/>
                                <text x="-14" y="-400" font-size="5">                    100%                </text>
                                <xsl:for-each-group select="$candidate-docs//ru:*" group="local-name()">
                                        <xsl:variable as="xs:integer" name="bar-height" select="count(current-group()) * $bar-scale"/>
                                        <rect x="{position() * $bar-width * 1.6 + 5}" y="{-$bar-height}" height="{$bar-height}" width="{$bar-width}" fill="blue"/>
                                </xsl:for-each-group>
                        </g>
                </svg>
        </xsl:template>
</xsl:stylesheet>