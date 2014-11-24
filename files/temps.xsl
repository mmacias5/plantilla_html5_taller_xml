<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  <head>
 
<style>

div   {
   text-align: center;
   z-index: 2;
}

img   {
   height: 150px;
   width: 150px;
}



</style>
  </head>
  <body>

  
<!-- 
Estructura fitxer XML
<current>
  <city id="3107677" name="Tortosa">
    <coord lon="0.52" lat="40.81"/>
    <country>ES</country>
    <sun rise="2014-11-11T06:40:43" set="2014-11-11T16:43:16"/>
  </city>
  <temperature value="11.007" min="11.007" max="11.007" unit="celsius"/>
  <humidity value="100" unit="%"/>
  <pressure value="988.64" unit="hPa"/>
  <wind>
    <speed value="3.01" name="Light breeze"/>
    <direction value="203.5" code="SSW" name="South-southwest"/>
  </wind>
  <clouds value="92" name="overcast clouds"/>
  <visibility/>
  <precipitation value="4.5" mode="rain" unit="3h"/>
  <weather number="501" value="moderate rain" icon="10d"/>
  <lastupdate value="2014-11-11T15:03:40"/>
</current>
--> 
   
<div>
	<p>
	<xsl:for-each select='current/city' >
		<xsl:value-of select="@name"/>
	</xsl:for-each>
	</p>
	
	<p>
	<xsl:for-each select='current/weather' >
	<img>
		<xsl:attribute name="src">http://openweathermap.org/img/w/<xsl:value-of select="@icon"/>.png</xsl:attribute> 
    </img>
	</xsl:for-each>
	</p>
	
	<p>
	<xsl:for-each select='current/temperature' >
		<xsl:value-of select="round(@value)"/>
		<xsl:choose>
			<xsl:when test="@unit='celsius'">
				ºC
			</xsl:when>
			<xsl:when test="@unit='farenheit'">
				ºF
			</xsl:when>			
		</xsl:choose>
	</xsl:for-each>
	</p>
		
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet> 