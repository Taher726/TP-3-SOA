<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
	      <head>
	        <title>Liste des Comptes</title>
	      </head>
	      <body>
	      <h1>Liste des comptes</h1>
	        <table border="1">
	          <tr>
	            <th>Code</th>
	            <th>Solde</th>
	            <th>Date de Création</th>
	          </tr>
	          <xsl:apply-templates select="BanqueService/getComptes"/>
	        </table>
	        <!-- 1. Créez une variable XSLT nommée « totalSolde » pour stocker la somme totale des soldes des comptes. -->
	        <xsl:variable name="totalSolde" select="sum(BanqueService/getComptes/solde)"/>
	        
	        <!-- 2. Utilisez cette variable pour afficher la somme totale dans le document HTML. -->
	        <p>Somme totale des soldes : <xsl:value-of select="$totalSolde"/></p>
	      	<h1>Liste des comptes filtrés</h1>
	        <table border="1">
	          <tr>
	            <th>Code</th>
	            <th>Solde</th>
	            <th>Date de Création</th>
	          </tr>
	          <xsl:apply-templates select="BanqueService/getComptes[substring(date, 1, 4) > 2000]"/>
	        </table>
	        <!-- 1. Créez une variable XSLT nommée « totalSolde » pour stocker la somme totale des soldes des comptes. -->
	        <xsl:variable name="totalSolde1" select="sum(BanqueService/getComptes[substring(date, 1, 4) > 2000]/solde)"/>
	        
	        <!-- 2. Utilisez cette variable pour afficher la somme totale dans le document HTML. -->
	        <p>Somme totale des soldes des comptes filtrés: <xsl:value-of select="$totalSolde1"/></p>
	      </body>
	    </html>
	 </xsl:template>
	 <xsl:template match="getComptes">
	    <tr>
	      <td><xsl:value-of select="code"/></td>
	      <td><xsl:value-of select="solde"/></td>
	      <td><xsl:value-of select="date"/></td>
	    </tr>
  	</xsl:template>
 </xsl:stylesheet>