<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:variable name="keysize">30</xsl:variable>
    <xsl:variable name="padding">2</xsl:variable>
    <xsl:variable name="rednum">150</xsl:variable>
    <xsl:variable name="bluenum">150</xsl:variable>
    <xsl:variable name="greennum">150</xsl:variable>
    <xsl:template match="/">


    <html>
        <body>
            
            <h1>SVG Keyboard</h1>
            
            <svg width="2000" height="1000">
                
            <xsl:apply-templates />
            </svg>
        </body>
    </html>
    </xsl:template>
    
    <xsl:template match="Key">
        
        <xsl:choose>
            <xsl:when test="./@type='modifier'">
                <rect x="{$keysize*Column+$padding*Column}" y="{$keysize*Row+$padding*Row}"  rx="3" ry="3" width="{($keysize*Width)+(((Width)-3)*$padding)}" height="{($keysize*Height)+(((Height)-3)*$padding)}"
                    style="stroke:black;stroke-width:1;opacity:0.5" fill="#ff0000" />
            </xsl:when>
            <xsl:when test="./@type='system'">
                <rect x="{$keysize*Column+$padding*Column}" y="{$keysize*Row+$padding*Row}"  rx="3" ry="3" width="{($keysize*Width)+(((Width)-3)*$padding)}" height="{($keysize*Height)+(((Height)-3)*$padding)}"
                    style="stroke:black;stroke-width:1;opacity:0.5" fill="#ff8000" />
            </xsl:when>
            <xsl:otherwise>
                <rect x="{$keysize*Column+$padding*Column}" y="{$keysize*Row+$padding*Row}"  rx="3" ry="3" width="{($keysize*Width)+(((Width)-3)*$padding)}" height="{($keysize*Height)+(((Height)-3)*$padding)}"
                    style="stroke:black;stroke-width:1;opacity:0.5" fill="rgb({$rednum},{$greennum}, {$bluenum} )" />
            </xsl:otherwise>
        </xsl:choose>
       
               
        <text 
            x="{$keysize*Column+8+$padding*Column}" y="{$keysize*Row+8+$padding*Row}"         
            style="
            font-family:Arial; 
            baseline-shift:-10; 
            font-size:10;
            fill:black;
            ">
            <xsl:value-of select="Name"/>
        </text>  </xsl:template>
    
</xsl:stylesheet>