$ScriptFromGithHub = Invoke-WebRequest https://raw.githubusercontent.com/rfduarte/ps1/master/Check-Services.ps1
Invoke-Expression $($ScriptFromGithHub.Content)