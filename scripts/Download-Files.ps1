# fccid.io Downloader
$Uri = 'https://fccid.io/XSG'

# Download Product List
$Uris = Invoke-WebRequest -Uri $Uri -SkipCertificateCheck -DisableKeepAlive -NoProxy -SkipHttpErrorCheck -SkipHeaderValidation
# Extract Vendor Grantee Code
$GranteeCode = Split-Path -Leaf $Uri
# Strip links without Grantee Code or RSS Feed
$Uris = $Uris.Links.href.Where({$_ -match "/$GranteeCode.(?!rss)."})

foreach ($Uri in $Uris) {
  $WebRequest = Invoke-WebRequest -Uri $Uri -SkipCertificateCheck -DisableKeepAlive -NoProxy -SkipHttpErrorCheck -SkipHeaderValidation
  $WebRequestLinks = ($WebRequest.Links).href
  foreach ($Link in $WebRequestLinks) {
    if ($Link -match "$Uri.*") {
      $WebRequestFiles = Invoke-WebRequest -Uri $Link -SkipCertificateCheck -DisableKeepAlive -NoProxy -SkipHttpErrorCheck -SkipHeaderValidation
      $WebRequestFiles = ($WebRequestFiles.Links).href
      foreach ($WebRequestFile in $WebRequestFiles) {
        if ($WebRequestFile -match ".*(pdf|doc)$") {
          $OutFile = Split-Path -Path $WebRequestFile -Leaf
          Write-Verbose -Message $OutFile -Verbose
          Invoke-WebRequest -Uri $WebRequestFile -OutFile $OutFile -SkipCertificateCheck -DisableKeepAlive -NoProxy -SkipHttpErrorCheck -SkipHeaderValidation
        }
      }
    }
  }
}
