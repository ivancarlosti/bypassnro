@echo off
:: Enable UTF-8 support
chcp 65001 > nul

:: Prompt to Run as administrator
Set "Variable=0" & if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs"
fsutil dirty query %systemdrive%  >nul 2>&1 && goto :(Privileges_got)
If "%1"=="%Variable%" (echo. &echo. Please right-click on the file and select &echo. "Run as administrator". &echo. Press any key to exit. &pause>nul 2>&1& exit)
cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "%~0", "%Variable%", "", "runas", 1 > "%temp%\getadmin.vbs"&cscript //nologo "%temp%\getadmin.vbs" & exit
:(Privileges_got)

setlocal enabledelayedexpansion

:: =============================================
:: DISABLE AIRPLANE MODE
:: =============================================
echo Disabling Airplane Mode...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\RadioManagement\SystemRadioState" /v "SystemRadioState" /t REG_DWORD /d 0 /f > nul
powershell -command "Set-NetRadioState -RadioState Off" 2>nul
echo [✓] Airplane Mode disabled.

:: =============================================
:: RE-ENABLE ALL NETWORK ADAPTERS (MULTI-METHOD)
:: =============================================
echo Attempting to enable all network adapters...

:: Method 1: netsh (for basic enable)
for /f "tokens=*" %%i in ('powershell -command "Get-NetAdapter | Select-Object -ExpandProperty Name"') do (
    echo Enabling adapter: %%i
    netsh interface set interface "%%i" admin=enable
)

:: Method 2: devcon (more reliable for stubborn adapters)
set "devconPath=%SystemRoot%\System32\devcon.exe"
if exist "!devconPath!" (
    echo Using devcon to force enable adapters...
    !devconPath! enable *DEV_*
    !devconPath! enable *VEN_*
    timeout /t 3 >nul
)

:: Method 3: PowerShell (most reliable)
echo Using PowerShell to ensure enablement...
powershell -command "Get-NetAdapter | Enable-NetAdapter -Confirm:$false"
timeout /t 3 >nul

:: Verify results
echo Current adapter status:
powershell -command "Get-NetAdapter | Format-Table Name,Status -AutoSize"

:: =============================================
:: (4) FORCE NETWORK RESTART
:: =============================================
echo Restarting network services...
net stop dnscache >nul 2>&1
net stop NlaSvc >nul 2>&1
net start NlaSvc >nul 2>&1
net start dnscache >nul 2>&1

echo.
echo [✓] Network should now be fully enabled.
pause