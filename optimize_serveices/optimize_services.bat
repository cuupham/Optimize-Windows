@echo off
set ServicesFile=%~dp0services_to_disable.txt
if not exist %ServicesFile% (
    echo File not found: %ServicesFile%
    exit /b 1
)

echo Reading service names from file: %ServicesFile%
echo -------------------------------
REM Bắt đầu phạm vi cục bộ
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "tokens=*" %%a in (%ServicesFile%) do (
    set "ServiceName=%%a"
    if "!ServiceName!" neq "" (
        echo Running command for service: !ServiceName!
        sc config "!ServiceName!" start=disabled
        if errorlevel 1 (
            echo 'sc config' FAILED for "!ServiceName!", switch to 'reg add'
            reg add "HKLM\SYSTEM\CurrentControlSet\Services\!ServiceName!" /v "Start" /t REG_DWORD /d 4 /f >nul
            if errorlevel 1 (
                echo 'reg add'  FAILED for "!ServiceName!"
            ) else (
                echo 'reg add' SUCCEEDED for "!ServiceName!"
            )
            
        ) else (
            echo 'sc config' SUCCEEDED for "!ServiceName!"
        )
    )
    echo -------------------------------
)
REM Kết thúc phạm vi cục bộ
ENDLOCAL
echo -------------------------------
echo All services listed.
pause
