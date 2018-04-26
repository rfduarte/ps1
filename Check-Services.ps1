Write-Host "Is this script running in pre or post boot?"
    $PreOrPosBoot = Read-Host "( Pre / Pos )"
    Switch ($PreOrPosBoot)
    {
        Pre {Get-Service | Select Status,Name,StartType | Export-Csv C:\Users\ramon.duarte\Desktop\PreBootServices.csv}
        Pre {Write-Host "Done!"}
        Pos {Get-Service | Select Status,Name,StartType | Export-Csv C:\Users\ramon.duarte\Desktop\PosBootServices.csv}
        Pos {Compare-Object (Get-Content C:\Users\ramon.duarte\Desktop\PreBootServices.csv) (Get-Content C:\Users\ramon.duarte\Desktop\PosBootServices.csv)}
    }