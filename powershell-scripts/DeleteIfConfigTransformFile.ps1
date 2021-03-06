function DeleteIfConfigTransformFile($file)
{
    try
    {
        $xdoc = New-Object System.Xml.XmlDocument
        $xdoc.Load($file)

        if($xdoc.DocumentElement.xdt -eq "http://schemas.microsoft.com/XML-Document-Transform")
        {
            Write-Host "Deleting file:" $file
            Remove-Item $file
        }
        else
        {
            Write-Host "Not deleting config file (doesn't have the correct xdt xml namespace declaration):" $file
        }
    }
    catch
    {
        Write-Host "Could not xml parse file:" $file
    }    
}
