<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:html="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" indent="yes"/>
    
    <!-- Define CSS styles -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title><xsl:value-of select="view/trailers/title"/></title>
                <style type="text/css">
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        color: #333;
                        background-color: #f4f4f4;
                    }
                    h1 {
                        color: #0073e6;
                        font-size: 2em;
                        margin-bottom: 20px;
                    }
                    .container {
                        width: 80%;
                        margin: 0 auto;
                        background: #fff;
                        padding: 20px;
                        box-shadow: 0 0 10px rgba(0,0,0,0.1);
                        border-radius: 5px;
                    }
                    .trailers {
                        list-style-type: none;
                        padding: 0;
                    }
                    .trailers li {
                        margin-bottom: 20px;
                        border-bottom: 1px solid #ddd;
                        padding-bottom: 10px;
                    }
                    .trailers img {
                        max-width: 100%;
                        height: auto;
                    }
                    .trailers h2 {
                        color: #333;
                        font-size: 1.5em;
                        margin: 0;
                    }
                    .trailers p {
                        font-size: 1em;
                        line-height: 1.5;
                        margin: 10px 0;
                    }
                    .trailers a {
                        color: #0073e6;
                        text-decoration: none;
                    }
                    .trailers a:hover {
                        text-decoration: underline;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1><xsl:value-of select="view/trailers/title"/></h1>
                    <p><strong>Author:</strong> <xsl:value-of select="view/trailers/author"/></p>
                    <p><strong>Description:</strong> <xsl:value-of select="view/trailers/description"/></p>
                    <p><strong>Language:</strong> <xsl:value-of select="view/trailers/language"/></p>
                    <p><strong>Format:</strong> <xsl:value-of select="view/trailers/format"/></p>
                    <p><strong>Category:</strong> <xsl:value-of select="view/trailers/category/@text"/></p>
                    <img src="{view/trailers/image/@href}" alt="Trailer Image"/>
                    
                    <ul class="trailers">
                        <xsl:for-each select="view/trailers/item">
                            <li>
                                <h2><xsl:value-of select="title"/></h2>
                                <p><strong>Description:</strong> <xsl:value-of select="description"/></p>
                                <p><strong>Released:</strong> <xsl:value-of select="released"/></p>
                                <p><strong>Duration:</strong> <xsl:value-of select="duration"/></p>
                                <p><strong>Video:</strong> <a href="{enclosure/@url}">Watch Trailer</a></p>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
