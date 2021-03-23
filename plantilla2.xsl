<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/programa">
        <html>
            <head>
                <title>Programa</title>
            </head>
            <body>
                <xsl:apply-templates select="titulo" />
                <h2>Programa</h2>
                <xsl:apply-templates select="curso" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="titulo">
        <div><xsl:value-of select="nombre[@idioma='es']/text()" /></div>
		<div><xsl:value-of select="universidad/text()" /></div>
		<div><xsl:value-of select="centro/text()" /></div>
    </xsl:template>
	
	<xsl:template match="curso">
       <h3>Curso <xsl:value-of select="@numero" /></h3>
	   <xsl:for-each select="cuatrimestre">
	   <h4>Cuatrimestre <xsl:value-of select="@numero" /></h4>
	   <table>
	   <thead>
        <th>Asignatura</th><th>Créditos</th><th>Tipo</th>
		</thead>
		<xsl:for-each select="asignatura">
		<tr>
            <td><xsl:value-of select="nombre[@idioma='es']/text()" /></td>
			<td><xsl:value-of select="@ects" /></td>
			<xsl:choose> 
				<xsl:when test="@tipo=&quot;FB&quot;">
					<td>Formacion Basica</td>
				</xsl:when>
				<xsl:when test="@tipo=&quot;O&quot;">
					<td>Optativa</td>
				</xsl:when>
				<xsl:otherwise>
					<td>Other</td>
				</xsl:otherwise>
			</xsl:choose>
			
		</tr>
		</xsl:for-each>
	   </table>
	   </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>