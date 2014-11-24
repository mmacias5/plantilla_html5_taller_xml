<?php
function posa_temps()
{
$xslDoc = new DOMDocument();
$xslDoc->load("files/temps.xsl");   // carrega el fitxer XSL per donar format HTML a les dades 

$xmlDoc = new DOMDocument();
$xmlDoc->load("http://api.openweathermap.org/data/2.5/weather?q=Tortosa&mode=xml&units=metric"); // en aquest cas agafara la url 

$xsltProcessor = new XSLTProcessor();
$xsltProcessor->registerPHPFunctions();
$xsltProcessor->importStyleSheet($xslDoc);

echo $xsltProcessor->transformToXML($xmlDoc);  // Escriu el resultat de la transformació XSLT 
}
?>