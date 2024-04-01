@echo off
set ServicesFile=%~dp0unnecessary_services.txt
echo Reading service names from file: %ServicesFile%
echo -------------------------------
REM Bắt đầu phạm vi cục bộ
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "tokens=*" %%a in (%ServicesFile%) do (
    set ServiceName=%%a
    echo Running command for service: !ServiceName!
    REM sc config "!ServiceName!" start=disabled
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\!ServiceName!" /v "Start" /t REG_DWORD /d 4 /f
)
REM Kết thúc phạm vi cục bộ
ENDLOCAL
echo -------------------------------
echo All services listed.
pause
