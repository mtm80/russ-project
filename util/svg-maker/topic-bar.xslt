<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns="http://www.w3.org/2000/svg" version="2.0">
        <xsl:output indent="yes"/>
        <xsl:template match="/">
                <xsl:variable name="doc-report" select="doc('../../analysis/topic-docs.xml')"/>
                <xsl:variable select="$doc-report//doc[@candidate='putin']" name="candidate-docs"/>
                <xsl:variable select="//topic[@name]/@id" name="named-topic-ids"/>
                <xsl:variable select="1.0 div sum($candidate-docs//topic[@num = $named-topic-ids])" name="candidate-norm"/>
                <svg height="500">
                        <g transform="translate(40 370)">
                                <xsl:variable as="xs:double" name="max-pct" select="35"/>
                                <xsl:variable as="xs:integer" name="max-height" select="350"/>
                                <xsl:variable as="xs:integer" name="bar-scale" select="1000"/>
                                <xsl:variable as="xs:integer" name="bar-width" select="40"/>
                                <line x1="0" y1="0" x2="400" y2="0" stroke="black" stroke-width="2"/>
                                <line x1="0" y1="0" x2="0" y2="-360" stroke="black" stroke-width="2"/>
                                <text x="-35" y="-350" font-size="15">
                                        <xsl:value-of select="$max-pct"/>%
                                </text>
                                <xsl:for-each-group select="//topic[@name]" group-by="@name">
                                        <xsl:sort order="descending" select="sum($candidate-docs//topic[@num = current-group()/@id])"/>
                                        <xsl:variable as="xs:double" name="pct-relevant" select="$candidate-norm * sum($candidate-docs//topic[@num = current-group()/@id])"/>
                                        <xsl:variable as="xs:double" name="bar-height" select="$pct-relevant * $max-height * (100 div $max-pct)"/>
                                        <xsl:variable as="xs:double" name="x-position" select="position() * $bar-width * 1.6 - $bar-width div 2"/>
                                        <rect x="{$x-position}" y="{-$bar-height}" height="{$bar-height}" width="{$bar-width}" fill="blue"/>
                                        <text x="{$x-position  + $bar-width div 3}" y="10" transform="rotate(45 {$x-position  + $bar-width div 3} 10)">
                                                <xsl:value-of select="current-grouping-key()"/>
                                        </text>
                                </xsl:for-each-group>
                        </g>
                </svg>
        </xsl:template>
</xsl:stylesheet>