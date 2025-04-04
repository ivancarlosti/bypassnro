@echo off
:: Enable UTF-8 for special characters
chcp 65001 > nul

:: =============================================
:: BYPASS OOBE NETWORK REQUIREMENT
:: =============================================
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v BypassNRO /t REG_DWORD /d 1 /f > nul
echo [✓] Bypassed network requirement (OOBE).

:: =============================================
:: ENABLE AIRPLANE MODE
:: =============================================
echo Enabling Airplane Mode...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\RadioManagement\SystemRadioState" /v "SystemRadioState" /t REG_DWORD /d 1 /f > nul
echo [✓] Airplane Mode ON (All radios disabled).

:: =============================================
:: DISABLE ALL ETHERNET CONNECTIONS
:: =============================================
echo Disabling all Ethernet adapters...
for /f "tokens=*" %%i in ('powershell -command "Get-NetAdapter -Physical | Where-Object {$_.MediaType -eq '802.3'} | Select-Object -ExpandProperty Name"') do (
    netsh interface set interface "%%i" admin=disable
)
echo [✓] All Ethernet connections disabled.

:: =============================================
:: REBOOT WITH WARNING
:: =============================================
echo.
shutdown /r /t 5 /c "Script completed. Rebooting in 5 seconds..."
echo [!] Machine will reboot in 5 seconds (press Ctrl+C to cancel).
pause