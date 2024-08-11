<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns="http://www.example.com/cropmonitoring">

    <xsl:output method="html" indent="yes"/>
    
    <!-- Template to match the root element -->
    <xsl:template match="/ns:CropMonitoring">
        <html>
            <head>
                <title>Crop Monitoring Report</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                    }
                    th {
                        background-color: #f2f2f2;
                        text-align: left;
                    }
                    td {
                        text-align: left;
                    }
                </style>
            </head>
            <body>
                <h1>Crop Monitoring Report</h1>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Planting Date</th>
                            <th>Harvest Date</th>
                            <th>Growth Stage</th>
                            <th>Water Level</th>
                            <th>Pests</th>
                            <th>Notes</th>
                            <th>Fertilizer</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Template to match each Crop element -->
                        <xsl:for-each select="ns:Crop">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="ns:Name"/></td>
                                <td><xsl:value-of select="ns:PlantingDate"/></td>
                                <td><xsl:value-of select="ns:HarvestDate"/></td>
                                <td><xsl:value-of select="ns:GrowthStage"/></td>
                                <td><xsl:value-of select="ns:WaterLevel"/></td>
                                <td>
                                    <xsl:for-each select="ns:PestInfo/ns:Pest">
                                        <xsl:value-of select="."/>
                                        <xsl:if test="position() != last()">, </xsl:if>
                                    </xsl:for-each>
                                </td>
                                <td><xsl:value-of select="ns:Notes"/></td>
                                <td>
                                    Type: <xsl:value-of select="ns:Fertilizer/@type"/>
                                    , Amount: <xsl:value-of select="ns:Fertilizer/@amount"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
