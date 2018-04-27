<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns:ru="http://ru-rhetoric.obdurodon.org/rr"
        xmlns="http://www.w3.org/2000/svg" version="2.0" exclude-result-prefixes="#all">
        <xsl:output indent="yes"/>
        <xsl:template match="/">
                <xsl:variable name="candidate-docs" select="collection('../../xml/putin')"/>
                <xsl:variable name="total-evidence" as="xs:integer" select="count($candidate-docs//ru:evidence)"/>
                <xsl:variable name="true-count" as="xs:integer" select="count($candidate-docs//ru:evidence[@truth='true'])"/>
                <xsl:variable name="false-count" as="xs:integer" select="count($candidate-docs//ru:evidence[@truth='false'])"/>
                <xsl:variable name="false-width" as="xs:double" select="$false-count div $total-evidence * 100"/>
                <xsl:variable name="true-width" as="xs:double" select="$true-count div $total-evidence * 100"/>
                <xsl:variable name="unknown-width" as="xs:double" select="100 - $false-width - $true-width"/>
                <svg viewBox="0 0 100 20">
                        <rect x="0" y="0" height="20" width="{$true-width}" fill="green"/>
                        <text x="13" y="13" fill="white" font-size="10">
                                <xsl:text>+</xsl:text>
                                <xsl:value-of select="$true-count"/>
                        </text>
                        <rect x="{$true-width}" y="0" height="20" width="{$unknown-width}" fill="black"/>
                        <text x="{$true-width + 15}" y="13" fill="white" font-size="10">
                                <xsl:value-of select="$total-evidence - $true-count - $false-count"/>
                        </text>
                        <rect x="{$true-width + $unknown-width}" y="0" height="20" width="{$false-width}" fill="red"/>
                        <text x="{$true-width + $unknown-width + 1}" y="13" fill="white" font-size="10">
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="$false-count"/>
                        </text>
                </svg>
        </xsl:template>
</xsl:stylesheet>