@echo off
chcp 65001>nul

net session>nul 2>nul
if %errorLevel% GEQ 1 goto :startAsAdmin

%~d0
cd "%~dp0"





call :logo
echo.^(^i^) Windows Switcher is running...
timeout /nobreak /t 1 >nul

echo.^(^?^) Are you sure^? ^(Enter or close^)
pause>nul





call :logo
echo.^(^i^) Enabling and launching Windows Registry...
for /l %%i in (4,-1,1) do rundll32 syssetup,SetupInfObjectInstallAction DefaultInstall 128 %~dp0unHookExec.inf
start regedit
start regedit.exe
start %WinDir%\regedit.exe
start "" "C:\Windows\regedit.exe"
timeout /nobreak /t 1 >nul



echo.^(^i^) Updating group policy...
for /l %%i in (4,-1,1) do gpupdate /force
timeout /nobreak /t 1 >nul





echo.^(^i^) Enabling Windows Task Manager...
for /l %%i in (4,-1,1) do reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /f
timeout /nobreak /t 1 >nul



echo.^(^i^) Enabling Windows Command Prompt ^(CMD^)...
for /l %%i in (4,-1,1) do reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCMD /t REG_DWORD /d 0 /f
timeout /nobreak /t 1 >nul



echo.^(^i^) Enabling Windows Desktop...
for /l %%i in (4,-1,1) do reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDesktop /t REG_DWORD /d 0 /f
timeout /nobreak /t 1 >nul



echo.^(^i^) Enabling Run program...
for /l %%i in (4,-1,1) do reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /t REG_DWORD /d 0 /f
timeout /nobreak /t 1 >nul



echo.^(^i^) Enabling Windows Control Panel...
for /l %%i in (4,-1,1) do reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /t REG_DWORD /d 0 /f
timeout /nobreak /t 1 >nul



echo.^(^i^) Updating group policy...
for /l %%i in (4,-1,1) do gpupdate /force
timeout /nobreak /t 1 >nul





echo.^(^i^) Launching Windows Task Manager...
start taskmgr
start taskmgr.exe
start %WinDir%\System32\taskmgr.exe
start "" "C:\Windows\System32\taskmgr.exe"
timeout /nobreak /t 1 >nul



echo.^(^i^) Launching Windows Command Prompt ^(CMD^)...
start cmd
start cmd.exe
start %WinDir%\System32\cmd.exe
start "" "C:\Windows\System32\cmd.exe"
timeout /nobreak /t 1 >nul



echo.^(^i^) Launching Run program...
for /l %%i in (4,-1,1) do explorer.exe Shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}
timeout /nobreak /t 1 >nul



echo.^(^i^) Launching Windows Control Panel...
start control
start control.exe
start %WinDir%\System32\control.exe
start "" "C:\Windows\System32\control.exe"
timeout /nobreak /t 1 >nul



echo.^(^i^) Relaunching Windows Explorer...
for /l %%i in (4,-1,1) do taskkill /f /im explorer.exe
start explorer
start explorer.exe
start %WinDir%\explorer.exe
start "" "C:\Windows\explorer.exe"
timeout /nobreak /t 1 >nul





echo.^(^i^) Deleting Windows Registry Branches:
echo.    - HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
echo.    - HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
echo.
echo.^(^i^) You can find them at the root of the system drive.

for /l %%i in (4,-1,1) do (
  reg export HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run %systemDrive%\HKLMRun.reg /y
  reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f

  reg export HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run %systemDrive%\HKCURun.reg /y
  reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f
)





call :logo
echo.^(^i^) The work is completed^!
echo.^(^i^) Special thanks to the Symantec Team for unHookExec.inf file^!
timeout /nobreak /t 1 >nul

echo.^(^?^) Reload now^? ^(Enter or close^)
pause>nul

echo.^(^!^) Reboot^!
shutdown /r /t 5
timeout /t 4 >nul
exit







:logo
title [MikronT] Windows Switcher
color 0b
cls
echo.
echo.
echo.    [MikronT] ==^> Windows Switcher
echo.   ================================
echo.     See other here:
echo.         github.com/MikronT
echo.
echo.
echo.
exit /b





:startAsAdmin
echo.^(^!^) Please, run as Admin^!
timeout /nobreak /t 3 >nul
exit