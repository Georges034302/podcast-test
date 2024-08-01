<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="view/trailers/title"/></title>
            </head>
            <body>
                <h1><xsl:value-of select="view/trailers/title"/></h1>
                <p><strong>Author:</strong> <xsl:value-of select="view/trailers/author"/></p>
                <p><strong>Description:</strong> <xsl:value-of select="view/trailers/description"/></p>
                <p><img src="{view/trailers/image/@href}" alt="Movies Info"/></p>
                <p><strong>Language:</strong> <xsl:value-of select="view/trailers/language"/></p>
                <p><strong>Format:</strong> <xsl:value-of select="view/trailers/format"/></p>
                <p><a href="{view/trailers/link}">Visit Trailer Viewer</a></p>
                <p><strong>Category:</strong> <xsl:value-of select="view/trailers/category/@text"/></p>
                
                <h2>Movies</h2>
                <table border="1">
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Released</th>
                        <th>Duration</th>
                        <th>Trailer</th>
                    </tr>
                    <xsl:for-each select="view/trailers/item">
                        <tr>
                            <td><xsl:value-of select="title"/></td>
                            <td><xsl:value-of select="description"/></td>
                            <td><xsl:value-of select="released"/></td>
                            <td><xsl:value-of select="duration"/></td>
                            <td><a href="{enclosure/@url}">Watch</a> (<xsl:value-of select="enclosure/@size"/> KB)</td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
