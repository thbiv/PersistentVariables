Function SaveXMLData {
    Param (
        [psobject]$InputObject,
        [string]$Path
    )
    $XMLWriter = New-Object -TypeName System.Xml.XmlTextWriter($Path,$Null)
    $XMLWriter.Formatting = 'Indented'
    $XMLWriter.Indentation = 1
    $XMLWriter.IndentChar = "`t"
    $XMLWriter.WriteStartDocument()
    $XMLWriter.WriteProcessingInstruction("xml-stylesheet", "type='text/xsl' href='style.xsl;")
    $XMLWriter.WriteStartElement('persistentvariables')
        $XMLWriter.WriteStartElement('variables')
            ForEach ($Item in $InputObject) {
            $XMLWriter.WriteStartElement('item')
                $XMLWriter.WriteAttributeString("name","$($Item.name)")
                $XMLWriter.WriteAttributeString("value","$($Item.value)")
            $XMLWriter.WriteEndElement() #End item Element
        }
        $XMLWriter.WriteEndElement() #End variables Element
    $XMLWriter.WriteEndElement() #End persistentvariables Element
    $XMLWriter.WriteEndDocument()
    $XMLWriter.Flush()
    $XMLWriter.Close()
}