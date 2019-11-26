
$hostname = $env:COMPUTERNAME
$date = Get-Date -UFormat %d/%M/%Y
$hour = Get-Date -UFormat %H:%m
$FirewallStatePublic = (Get-NetFirewallProfile -Name Public).Enabled
$FirewallStatePrivate = (Get-NetFirewallProfile -Name Private).Enabled
$FirewallStateDomain = (Get-NetFirewallProfile -Name Domain).Enabled
$LocalAdmin = (Get-LocalUser -Name admativas -ErrorAction SilentlyContinue).Enable 




$OSReport = New-Object -TypeName psobject

$OSReport | Add-Member -MemberType NoteProperty -Name Hostname -Value $hostname
$OSReport | Add-Member -MemberType NoteProperty -Name Data -Value $date
$OSReport | Add-Member -MemberType NoteProperty -Name Hora -Value $hour
$OSReport | Add-Member -MemberType NoteProperty -Name 'FirewallStatePublic' -Value $FirewallStatePublic
$OSReport | Add-Member -MemberType NoteProperty -Name 'FirewallStatePrivate' -Value $FirewallStatePrivate
$OSReport | Add-Member -MemberType NoteProperty -Name 'FirewallStateDomain' -Value $FirewallStateDomain
$OSReport | Add-Member -MemberType NoteProperty -Name 'LocalAdmin' -Value $LocalAdmin



$OSReport

