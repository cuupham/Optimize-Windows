# File .bat:
Run as admin

reg add "HKLM\SYSTEM\CurrentControlSet\Services\!ServiceName!" /v "Start" /t REG_DWORD /d 4 /f

Các chế độ:
0: Boot (System boot)
1: System (Automatic start during OS initialization)
2: Automatic (Automatic start at OS startup)
3: Manual (Start on demand)
4: Disabled (Do not start)


# Run in Powershell
1. Get list DisplayName, ServiceName start-up=disabled
Get-Service | Where-Object { $_.StartType -eq "Disabled" } | Select-Object DisplayName, ServiceName

2. Get list DisplayName / start-up=disabled
Get-Service | Where-Object { $_.StartType -eq "Disabled" } | Select-Object DisplayName
