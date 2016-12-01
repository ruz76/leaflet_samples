<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Czech Republic</title>
		<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.1/dist/leaflet.css" />
		<script src="https://unpkg.com/leaflet@1.0.1/dist/leaflet.js"></script>
		<script src="http://gisak.vsb.cz/ruzicka/lib/leaflet/showplace.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>
	$(document).ready(function(){
		
		setMap('mapid');
		$("#mapid").hide();
		
		$("strong").click(function(){
			
			$("#mapid").show();
			
			var lat = $(this).attr("lat");
			var lon = $(this).attr("lon");
			var zoom = $(this).attr("zoom");
			var text = $(this).attr("text");
			
			showPlace(lat, lon, zoom, text);
		});
	});
		</script>	
      </head>
      <body>
        <h2>Wonderfull Cities of Czech Republic</h2>
        <p>On September 10th we arrived in the Czech Republic and visited some of its wonderful cities.</p>
        <p>On September 17th we have been to 
			<xsl:call-template name="citytemplate">
				<xsl:with-param name="city" select = "//city[name='Place1']" />
			</xsl:call-template>. 
			For us it was the most beautiful city because of the numerous historical monuments that can be found in it. We have visited "The Charles Bridge", "St. Vitus Cathedral", "Prague Castle", and "Wenceslas Square", plus many other things.
		  </p>
          <p>On September 24 we visited 
			<xsl:call-template name="citytemplate">
				<xsl:with-param name="city" select = "//city[name='Place2']" />
			</xsl:call-template>.
			, where we went to see "St. Peter and St. Paul's Cathedral", "The Moravia Museum" and "The Church of St. James".</p>
		  <div id="mapid" style="width: 600px; height: 400px;"></div>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="citytemplate">
	<xsl:param name="city" />
	<xsl:variable name="name" select = "$city/name"/>
	<xsl:variable name="lat" select = "substring-before($city/coordinates, ' ')"/>
	<xsl:variable name="lon" select = "substring-after($city/coordinates, ' ')"/>
	<strong lat="{$lat}" lon="{$lon}" zoom="10" text="Here is {$name}"><xsl:value-of select="$city/name"/></strong>
  </xsl:template>
</xsl:stylesheet>