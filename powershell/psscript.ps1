param( 
[string]$username, 
[string]$password, 
[string]$emailaddr, 
[string]$ruleName 
  
) 
   
$secpasswd = ConvertTo-SecureString $password -AsPlainText -Force  
$UserCredential = New-Object System.Management.Automation.PSCredential ($username, $secpasswd) 
  
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection  
Import-PSSession $Session -DisableNameChecking  
Set-HostedContentFilterPolicy -Identity $ruleName -BlockedSenders @{Add=$emailaddr}
