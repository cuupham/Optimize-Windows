# File .bat

Cần run as admin để thực hiện được reg add

## Show info Services

Run in Powershell

1. Get list DisplayName, ServiceName start-up=disabled
Get-Service | Where-Object { $_.StartType -eq "Disabled" } | Select-Object DisplayName, ServiceName

2. Get list DisplayName / start-up=disabled
Get-Service | Where-Object { $_.StartType -eq "Disabled" } | Select-Object DisplayName
