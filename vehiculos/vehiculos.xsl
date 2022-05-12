<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html>
<head>
<title>Vehiculos</title>
</head>
<body>
    <h2>Vehiculos ordenados por marca</h2>
    <table border="1">
        <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Precio</th>
        </tr>
            <xsl:for-each select="vehiculos/vehiculo">
                <xsl:sort select="marca"/>
        <tr>
                <td><xsl:value-of select="modelo"/></td>
                <td><xsl:value-of select="marca"/></td>
                <td><xsl:value-of select="precio"/></td>
        </tr>
        </xsl:for-each>   
    </table>

    <h2>Coches gasolina y automáticos</h2>
    <table border="1">
        <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Precio</th>
            <th>Combustible</th>
            <th>Cambio</th>

        </tr>
            <xsl:for-each select="vehiculos/vehiculo">
                <xsl:if test="@cambio ='automatico' and @combustible ='gasolina' ">
        <tr>
                <td><xsl:value-of select="modelo"/></td>
                <td><xsl:value-of select="marca"/></td>
                <td><xsl:value-of select="precio"/></td>   
                <td><xsl:value-of select="@combustible"/></td>
                <td><xsl:value-of select="@cambio"/></td>   
        </tr>
                </xsl:if>
        </xsl:for-each>   
    </table>

    <h2>Coches más baratos = 20000 € </h2>
    <table border="1">
        <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Precio</th>
            <th>Combustible</th>
            <th>Año</th>

        </tr>
            <xsl:for-each select="vehiculos/vehiculo">
                <xsl:choose>
                    <xsl:when test="precio &lt; 20000">
        <tr>
                <td style="background-color:green"><xsl:value-of select="modelo"/></td>
                <td style="background-color:green"><xsl:value-of select="marca"/></td>
                <td style="background-color:green"><xsl:value-of select="precio"/></td>   
                <td style="background-color:green"><xsl:value-of select="@combustible"/></td> 
                <td style="background-color:green"><xsl:value-of select="anno"/></td> 
        </tr>

                     </xsl:when>

                    <xsl:otherwise>

        <tr>
                <td><xsl:value-of select="modelo"/></td>
                <td><xsl:value-of select="marca"/></td>
                <td><xsl:value-of select="precio"/></td>   
                <td><xsl:value-of select="@combustible"/></td>
                <td><xsl:value-of select="anno"/></td>
        </tr>
                    </xsl:otherwise>
                </xsl:choose>
               
        </xsl:for-each>   
    </table>

    <h2>Coches no gasolina, ordenados por precio</h2>

    <table border="1">
        <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Precio</th>
            <th>Combustible</th>
        </tr>
        <xsl:for-each select="vehiculos/vehiculo">
            <xsl:sort select="precio"/>
                <xsl:if test= "@combustible !='gasolina' ">
                
        <tr>
                <td><xsl:value-of select="modelo"/></td>
                <td><xsl:value-of select="marca"/></td>
                <td><xsl:value-of select="precio"/></td>   
                <td><xsl:value-of select="@combustible"/></td>
                 
        </tr>
                </xsl:if>
        </xsl:for-each>   

    </table>

    <h2>3 Coches más caros</h2>

    <table border="1">
        <tr>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Precio</th>
            <th>Combustible</th>
        </tr>
        <xsl:for-each select="vehiculos/vehiculo">
            <xsl:sort select="precio" data-type="number" order="descending"/>
                <xsl:if test="position() &lt;= 3">
                
                
        <tr>
                <td><xsl:value-of select="modelo"/></td>
                <td><xsl:value-of select="marca"/></td>
                <td><xsl:value-of select="precio"/></td>   
                <td><xsl:value-of select="@combustible"/></td>
                 
        </tr>
               </xsl:if>
        </xsl:for-each>   

    </table>

</body>
</html>
</xsl:template>
</xsl:transform>