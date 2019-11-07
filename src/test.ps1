Add-Type -AssemblyName System.web
$raw_password = [System.Web.Security.Membership]::GeneratePassword(42, 10)
$password = ConvertTo-SecureString $raw_password -AsPlainText -Force
Set-LocalUser -Name "circleci" -Password $password
$username = "circleci"
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $password
$job = Start-Job -Credential $cred -ScriptBlock {
  Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3" -All -NoRestart
}
$progresspreference = 'silentlycontinue'
$job | Receive-Job -Wait