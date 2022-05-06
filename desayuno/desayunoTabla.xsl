<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html>
<head>
<title>Desayunos tabla</title>
</head>
<body>
<h2>Desayunos</h2>
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Calorias</th>
        </tr>
            <xsl:for-each select="breakfast_menu/food">
        <tr>
                <td><xsl:value-of select="name"/></td>
                <td><xsl:value-of select="price"/></td>
                <td><xsl:value-of select="calories"/></td>  
        </tr>
        </xsl:for-each>   
    </table>
<h2>Desayunos ordenados por nombre</h2>
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Calorias</th>
        </tr>
            <xsl:for-each select="breakfast_menu/food">
                <xsl:sort select="name"/>
        <tr>
                <td><xsl:value-of select="name"/></td>
                <td><xsl:value-of select="price"/></td>
                <td><xsl:value-of select="calories"/></td>  
        </tr>
        </xsl:for-each>   
    </table>
<h2>Desayunos con mas de 850 calorias</h2>
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Calorias</th>
        </tr>
            <xsl:for-each select="breakfast_menu/food">
                <xsl:if test="calories &gt; 850">
        <tr>
                <td><xsl:value-of select="name"/></td>
                <td><xsl:value-of select="price"/></td>
                <td><xsl:value-of select="calories"/></td>  
        </tr>
                </xsl:if>
        </xsl:for-each>   
    </table>

<h2>Desayunos con precio mayor de 9 libras en rojo </h2>
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Calorias</th>
        </tr>
            <xsl:for-each select="breakfast_menu/food">
                <xsl:choose>
                    <xsl:when test="price &gt; 800">
        <tr>
                <td style="background-color:red"><xsl:value-of select="name"/></td>
                <td style="background-color:red"><xsl:value-of select="price"/></td>
                <td style="background-color:red"><xsl:value-of select="calories"/></td>  
        </tr>
                    </xsl:when>

                    <xsl:otherwise>
        <tr>
                <td><xsl:value-of select="name"/></td>
                <td><xsl:value-of select="price"/></td>
                <td><xsl:value-of select="calories"/></td>  
        </tr>

                    </xsl:otherwise>

                </xsl:choose>
        </xsl:for-each>   
    </table>

</body>
</html>
</xsl:template>
</xsl:transform>