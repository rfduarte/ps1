Write-Host "Is this script running in pre or post boot?"
    $PreOrPosBoot = Read-Host "( Pre / Pos )"
    Switch ($PreOrPosBoot)
    {
        Pre {Get-Service | Select Status,Name,StartType | Export-Csv C:\PerfLogs\PreBootServices.csv}
        Pre {Write-Host "Done!"}
        Pos {Get-Service | Select Status,Name,StartType | Export-Csv C:\PerfLogs\PosBootServices.csv}
        Pos {Compare-Object (Get-Content C:\PerfLogs\PreBootServices.csv) (Get-Content C:\PerfLogs\PosBootServices.csv)}
    }
