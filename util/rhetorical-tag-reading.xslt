<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <section>
            <h2>Rhetorical devices</h2>
            <p>To best understand how each politician talks to the general public, we decided to
                develop a system for annotating rhetorical tags, adapted from Rashidi and
                Souzandehfar's work on discourse analysis. We settled on a set of 16 tags to help 
                us profile the candidates' rhetorical style.</p>
            <ul>
                <xsl:apply-templates select="//device">
                    <xsl:sort select="name" data-type="text"/>
                </xsl:apply-templates> 
            </ul>
        </section>
    </xsl:template>
    <xsl:template match="device">
        <li>
            <span class="device-name">
                <xsl:apply-templates select="name"/>
            </span>
            <span class="device-tag">
                <xsl:text> (&lt;ru:</xsl:text>
                <xsl:apply-templates select="@tag"/>
                <xsl:text>&gt;) : </xsl:text>
            </span>
            <xsl:apply-templates select="long"/>
        </li>
    </xsl:template>
</xsl:stylesheet>
