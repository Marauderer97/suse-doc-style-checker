<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

  <xsl:include href="../library.xsl"/>


  <xsl:template match="*" mode="part-title">Procedures</xsl:template>

  <xsl:template match="procedure">
    <xsl:variable name="steps" select="count(step)"/>
    <xsl:choose>
      <xsl:when test="$steps > 10">
        <result>
          <warning>Procedure <xsl:call-template name="createid"/> has <xsl:value-of select="$steps"/> steps.</warning>
          <expectation>Procedures may contain up to 10 steps.</expectation>
        </result>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>