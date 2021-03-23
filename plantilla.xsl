<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/jugadores">
        <html>
            <head>
			<style>
			table.st2{
			border: 1px solid black;
			}
			table.st1{
			border: 0px solid black;
			}

			td.st2 {
			border: 1px solid black;
			padding: 10px;
			}
			th.st2 {
			background-color:#101497;
			color: white;
			border: 1px solid black;
			padding: 10px
			}
			div.a{
			vertical-align: middle;
			font-size: 45px;
			font-family: Impact, Charcoal, sans-serif;
			}
			div.b{
			vertical-align: middle;
			font-size: 20px;
			text-align:center
			}
			</style>
                <title>GGEZ</title>
            </head>
            <body>
				<img src="champs/lol.png" align="right"  width="300" height="150"/>
                <h1>Players Database</h1>
				<xsl:for-each select="jugador">
					<h2>---------------------------------------------------------------</h2>
					<h2>Username: <xsl:value-of select="username/text()"/> </h2>
					<h2>Real Name: <xsl:value-of select="username/@realname"/> </h2>
					<h2>Summoner's Level: <xsl:value-of select="level/@ammount"/> </h2>
					<h2>ELO ==>  
						<xsl:choose> 
							<xsl:when test="elo!= ''">
								<xsl:value-of select="elo/text()"/>
							</xsl:when>
							<xsl:otherwise>
							UNRANKED
							</xsl:otherwise>
						</xsl:choose>
					</h2>
					<h2>
						Champions:
					</h2>
						<xsl:for-each select="campeones">
						<h3>**********************************************************************************************</h3>
						<table class="st1">
						<tr>
						<td><img src="champs/{@champname}.jpg" align="right"  width="70" height="70"/></td>
						<td><div class="a"><xsl:value-of select="@champname"/></div></td>
						</tr>
						</table>
						
						<h3>&#160;&#160;&#160;&#160;&#160;&#160;&#160;
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;
						Role - <xsl:value-of select="@role"/></h3>
						<h3> &#160;&#160;&#160;&#160;&#160;&#160;&#160;
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;
							Position -
						<xsl:choose> 
							<xsl:when test="@pos!= ''">
								<xsl:value-of select="@pos"/>
							</xsl:when>
							<xsl:otherwise>
							Polivalente
							</xsl:otherwise>
						</xsl:choose>
						</h3>
						
						<table class="st1">
						<tr>
						<td><xsl:apply-templates select="Abilities" /></td>
						<td> &#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;</td>
						<td><xsl:apply-templates select="Stats" /></td>
						</tr>
						</table>
						<br/><br/>
						</xsl:for-each>
					<h3>**********************************************************************************************</h3>
					<h2>---------------------------------------------------------------</h2>
				</xsl:for-each>
            </body>
        </html>
    </xsl:template>
	
	<xsl:template match="Abilities">
		<h3>&#160;&#160;&#160;&#160;&#160;&#160;&#160;
		&#160;&#160;&#160;&#160;&#160;&#160;&#160;
		Power Source - <xsl:value-of select="@source"/></h3>
        <table class="st2" style="float:left;">
			<tr>
				<th class="st2">&#160;</th>
				<th class="st2">Name</th>
				<th class="st2">Desc</th>
				<th class="st2">Cooldown</th>
				<th class="st2">AP</th>
				<th class="st2">CC</th>
			</tr>
			<tr>
				<th class="st2">Passive</th>
				<td class="st2"><xsl:value-of select="@passive"/></td>
				
			</tr>
			<tr>
				<th class="st2">Q</th>
				<td class="st2"><xsl:value-of select="Q/@nameq"/></td>
				<xsl:choose> 
					<xsl:when test="Q/@descq!= ''">
						<td class="st2"><xsl:value-of select="Q/@descq"/></td>
					</xsl:when>
					<xsl:otherwise>
							<td class="st2">NaN (Implemented Soon!)</td>
					</xsl:otherwise>
				</xsl:choose>
				<td class="st2"><xsl:value-of select="Q/Cooldown/@Time"/></td>
				<xsl:choose> 
					<xsl:when test="Q/AP/@number!= ''">
						<td class="st2"><xsl:value-of select="Q/AP/@number"/></td>
					</xsl:when>
					<xsl:otherwise>
							<td class="st2">Self</td>
					</xsl:otherwise>
					
				</xsl:choose>
				<td class="st2"><xsl:value-of select="Q/@ccq"/></td>
			</tr>
			<tr>
				<th class="st2">W</th>
				<td class="st2"><xsl:value-of select="W/@namew"/></td>
				<xsl:choose> 
					<xsl:when test="W/@descw!= ''">
						<td class="st2"><xsl:value-of select="W/@descw"/></td>
					</xsl:when>
					<xsl:otherwise>
							<td class="st2">NaN (Implemented Soon!)</td>
					</xsl:otherwise>
				</xsl:choose>
				<td class="st2"><xsl:value-of select="W/Cooldown/@Time"/></td>
				<xsl:choose> 
					<xsl:when test="W/AP/@number!= ''">
						<td class="st2"><xsl:value-of select="W/AP/@number"/></td>
					</xsl:when>
					<xsl:otherwise>
							<td class="st2">Self</td>
					</xsl:otherwise>
					
				</xsl:choose>
				<td class="st2"><xsl:value-of select="W/@ccw"/></td>
			</tr>
			<tr>
				<th class="st2">E</th>
				<td class="st2"><xsl:value-of select="E/@namee"/></td>
				<xsl:choose> 
					<xsl:when test="E/@desce!= ''">
						<td class="st2"><xsl:value-of select="E/@desce"/></td>
					</xsl:when>
					<xsl:otherwise>
							<td class="st2">NaN (Implemented Soon!)</td>
					</xsl:otherwise>
				</xsl:choose>
				<td class="st2"><xsl:value-of select="E/Cooldown/@Time"/></td>
				<xsl:choose> 
					<xsl:when test="E/AP/@number!= ''">
						<td class="st2"><xsl:value-of select="E/AP/@number"/></td>
					</xsl:when>
					<xsl:otherwise>
							<td class="st2">Self</td>
					</xsl:otherwise>
					
				</xsl:choose>
				<td class="st2"><xsl:value-of select="E/@cce"/></td>
			</tr>
			<tr>
				<th class="st2">R</th>
				<td class="st2"><xsl:value-of select="R/@namer"/></td>
				<xsl:choose> 
					<xsl:when test="R/@descr!= ''">
						<td class="st2"><xsl:value-of select="R/@descr"/></td>
					</xsl:when>
					<xsl:otherwise>
							<td class="st2">NaN (Implemented Soon!)</td>
					</xsl:otherwise>
				</xsl:choose>
				<td class="st2"><xsl:value-of select="R/Cooldown/@Time"/></td>
				<xsl:choose> 
					<xsl:when test="R/AP/@number!= ''">
						<td class="st2"><xsl:value-of select="R/AP/@number"/></td>
					</xsl:when>
					<xsl:otherwise>
							<td class="st2">Self</td>
					</xsl:otherwise>
				</xsl:choose>
				<td class="st2"><xsl:value-of select="R/@ccr"/></td>
			</tr>
		</table>
    </xsl:template>


	<xsl:template match="Stats">
		<table class="st2">
		<tr>
		<td colspan="2"><div class="b">Stadistics</div></td>
		</tr>
		<tr class="st2">
		<td class="st2">Life: <xsl:value-of select="@Life"/></td>
		<td class="st2">Damage: <xsl:value-of select="@Damage"/> </td>
		</tr>
		<tr class="st2">
		<td class="st2">Phy Dmg: <xsl:value-of select="@PhysicalDamage"/></td>
		<td class="st2">Mag Dmg: <xsl:value-of select="@MagicDamage"/></td>
		</tr>
		<tr class="st2">
		<td class="st2">Armor: <xsl:value-of select="@Armor"/></td>
		<td class="st2">Magic Res:<xsl:value-of select="@MagicResist"/></td>
		</tr>
		<tr class="st2">
		<td class="st2">Mov. Speed: <xsl:value-of select="@MovementSpeed"/></td>
		<td class="st2">CDR: <xsl:value-of select="@CooldownReduction"/></td>
		</tr>
		</table>
	</xsl:template>
	
</xsl:stylesheet>