# Install every .crt-File in $PWD in both Cert Stores (Admin Rights for LocalMachine needed^^)
foreach ($crt in $(Get-ChildItem -Path *.crt).FullName) {
$certStoreLocationsCU = $(Get-ChildItem -Path Cert:\CurrentUser\).Name
$certStoreLocationsLM = $(Get-ChildItem -Path Cert:\LocalMachine\).Name
foreach ($crtLocCU in $certStoreLocationsCU){Import-Certificate -FilePath $crt -CertStoreLocation "Cert:\CurrentUser\$crtLocCU"}
foreach ($crtLocLM in $certStoreLocationsLM){Import-Certificate -FilePath $crt -CertStoreLocation "Cert:\LocalMachine\$crtLocLM"}}
