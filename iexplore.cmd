@echo off
chcp 65001



call :logo
echo.^(^?^) Ви впевнені^? ^(Enter або закрийте вікно^)
pause>nul

call :logo
echo.^(^!^) Запуск [ADSI] TurnON...
>nul timeout /nobreak /t 3





echo.^(^!^) Увімкнення Провідника Windows...
start explorer
start explorer.exe
start %WinDir%\explorer.exe
start "" "C:\Windows\explorer.exe"
>nul timeout /nobreak /t 3



echo.^(^!^) Увімкнення Диспетчера задач Windows...
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /f
start taskmgr
start taskmgr.exe
start %WinDir%\System32\taskmgr.exe
start "" "C:\Windows\System32\taskmgr.exe"
>nul timeout /nobreak /t 3



echo.^(^!^) Увімкнення Реєстру Windows...
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 0 /f
start regedit
start regedit.exe
start %WinDir%\regedit.exe
start "" "C:\Windows\regedit.exe"
>nul timeout /nobreak /t 3



echo.^(^!^) Увімкнення Інтерпретатора команд Windows...
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCMD /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCMD /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCMD /t REG_DWORD /d 0 /f
start cmd
start cmd.exe
start %WinDir%\System32\cmd.exe
start "" "C:\Windows\System32\cmd.exe"
>nul timeout /nobreak /t 3



echo.^(^!^) Увімкнення Робочого столу Windows...
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDesktop /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDesktop /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDesktop /t REG_DWORD /d 0 /f
>nul timeout /nobreak /t 3



echo.^(^!^) Увімкнення Панелі керування Windows...
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /t REG_DWORD /d 0 /f
start control
start control.exe
start %WinDir%\System32\control.exe
start "" "C:\Windows\System32\control.exe"
>nul timeout /nobreak /t 3



echo.^(^!^) Видалення розділів Реєстру Windows:
echo.    - HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
echo.    - HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
echo.    
reg export HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run C:\HKLMRunBackup.reg /y
reg export HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run C:\HKLMRunBackup.reg /y
reg export HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run C:\HKLMRunBackup.reg /y
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f

reg export HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run C:\HKCURunBackup.reg /y
reg export HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run C:\HKCURunBackup.reg /y
reg export HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run C:\HKCURunBackup.reg /y
reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f
reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f
reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f



call :logo
echo.^(^!^) Роботу завершено^!
echo.^(^!^) Зараз можете закрити всі вікна або використовувати за призначенням.
>nul timeout /t 10
exit





:logo
title [ADSI] TurnON
color 0b
cls
echo.
echo.    [ADSI] ==^> TurnON
echo.
exit /b