$application_Name = "app-name"
$application_page = "http://AppUrl"
 
$certificate = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
 
$certificate.Import('C:\Certificates\BDSelfSIgnedCert.cer')
 
$startDate = $certificate.GetEffectiveDateString()
$endDate = $certificate.GetExpirationDateString()
$credValue = [System.Convert]::ToBase64String($certificate.GetRawCertData())
$azureADApplication = New-AzureRmADApplication -DisplayName $application_Name  -HomePage $application_Name  -IdentifierUris $application_Name   -CertValue $credValue -StartDate $startDate -EndDate $endDate
