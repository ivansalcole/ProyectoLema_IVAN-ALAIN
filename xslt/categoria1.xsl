<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:variable name="root" select="document('../xml/almacen.xml')/casaSubastas"/>
  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <title>AMSUB</title>
        <link rel="stylesheet" href="../assets/css/main.css"/>
      </head>
      <body>    
        <h1 id="cat">Catálogo AMSUB por Categorías</h1>
        <header id="header">
          <div class="inner">
            <a href="#" class="logo">AMSUB</a>
            <nav id="nav">
              <a href="../index.html">Página Principal</a>
              <a href="../xml/almacen.xml">Subastas</a>
              <a href="../xml/catalogo.xml">Catálogo</a>
              <a href="../web/contacto.html">Contacto</a>
            </nav>
          </div>
        </header>
        <xsl:for-each select="$root/categorias/categoria">
          <section>
            <h2><xsl:value-of select="@nombre"/></h2>
            
            <div class="categoria">
              
              <xsl:for-each select="lote">
                <article>
                  <h3><xsl:value-of select="nombre"/></h3>
                  <img src="{imagen}" width="150"/>
                  <p>
                    Precio actual:
                    <xsl:value-of select="precioActual"/> €
                  </p>
                  <a target="blank" href="{url}">Más información</a>
                </article>
              </xsl:for-each>
            </div>
          </section>
        </xsl:for-each>
        <div style="text-align:center; margin-top:30px; font-size:18px; font-weight:bold;"> 
          Total de productos: 
          <xsl:value-of select="count($root/categorias/categoria/lote)"/> 
        </div>
        <footer id="footer">
          <div class="inner">
            <div class="copyright">
              &#169; 2026 Alain Paunero e Ivan Salazar
              <p>retogroup08@gmail.com</p>
            </div>
          </div>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
