function Get-WinOps {
    [CmdletBinding()]
    param ()
    
    begin {

    $hostname = $env:COMPUTERNAME
    $date = Get-Date -Format "dd/MM/yyyy"
    $hour = Get-Date -Format "HH:mm"
    $LastBootUpTime = Get-CimInstance Win32_OperatingSystem | Select LastBootUpTime
        
    }
    
    process {

    $LUA = (Get-ItemProperty  HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system).EnableLUA

    $LUAState = $(if ($LUA -eq "1") {

        Write-Output Failed

        }
        else {

        Write-Output Pass  
    })

    $FirewallStatePublic = (Get-NetFirewallProfile -Name Public).Enabled
    
    $FirewallstatePublicStatus = $(if ($FirewallStatePublic -eq 'True') {

            Write-Output Failed
    
        }
        else {

            Write-Output Pass
        })


    $FirewallStatePrivate = (Get-NetFirewallProfile -Name Private).Enabled

    $FirewallstatePrivateStatus = $(if ($FirewallStatePrivate -eq 'True') {

            Write-Output Failed

        }
        else {

            Write-Output Pass
        })


    $FirewallStateDomain = (Get-NetFirewallProfile -Name Domain).Enabled

    $FirewallstateDomainStatus = $(if ($FirewallStateDomain -eq 'True') {

            Write-Output Failed

        }
        else {

            Write-Output Pass
        })

    $LocalAdmin = (Get-LocalUser -Name admativas -ErrorAction SilentlyContinue).Enabled
    
    $LocalAdminState = $(if ($LocalAdmin -eq 'True') {

            Write-Output Pass

        }
        else {
        
            Write-Output Failed
        
        })
    
        
    }
    
    end {

    $OSReport = New-Object -TypeName psobject
    $OSReport | Add-Member -MemberType NoteProperty -Name Hostname -Value $hostname
    $OSReport | Add-Member -MemberType NoteProperty -Name Data -Value $date
    $OSReport | Add-Member -MemberType NoteProperty -Name Hora -Value $hour
    $OSReport | Add-Member -MemberType NoteProperty -Name 'Ultimo Boot' -Value $LastBootUpTime
    $OSReport | Add-Member -MemberType NoteProperty -Name 'FirewallStatePublic' -Value $FirewallstatePublicStatus
    $OSReport | Add-Member -MemberType NoteProperty -Name 'FirewallStatePrivate' -Value $FirewallstatePrivateStatus
    $OSReport | Add-Member -MemberType NoteProperty -Name 'FirewallStateDomain' -Value $FirewallstateDomainStatus
    $OSReport | Add-Member -MemberType NoteProperty -Name 'LocalAdmin' -Value $LocalAdminState
    $OSReport | Add-Member -MemberType NoteProperty -Name 'UAC' -Value $LUAState
    $OSReport
       
    }
}