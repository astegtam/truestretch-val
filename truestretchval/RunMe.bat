@echo off
setlocal enabledelayedexpansion

:: --- Admin check ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

:: --- Real Python check (not just PATH stub) ---
set PYTHON_OK=0
for /f "delims=" %%v in ('python --version 2^>^&1') do (
    echo %%v | findstr /i "Python" >nul
    if !errorLevel! equ 0 (
        set PYTHON_OK=1
    )
)

if !PYTHON_OK! equ 1 (
    echo [*] Python found, continuing...
    goto RUN_SCRIPT
)

echo [*] Python not found. Downloading and installing...
echo [*] This may take a few minutes, please wait...

:: --- Disable the Microsoft Store alias so it stops blocking python.exe ---
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\App Paths\python.exe" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\App Paths\python3.exe" /f >nul 2>&1

:: --- Download the Python installer ---
set PYTHON_VERSION=3.12.4
set PYTHON_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-amd64.exe
set INSTALLER=%~dp0python_installer.exe

powershell -Command "Invoke-WebRequest -Uri '%PYTHON_URL%' -OutFile '%INSTALLER%'"

if not exist "%INSTALLER%" (
    echo [!] Could not download Python. Check your internet connection.
    pause
    exit /b 1
)

echo [*] Installing Python...
"%INSTALLER%" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

del "%INSTALLER%"

timeout /t 5 /nobreak >nul

call :RefreshPath

set PYTHON_OK=0
for /f "delims=" %%v in ('python --version 2^>^&1') do (
    echo %%v | findstr /i "Python" >nul
    if !errorLevel! equ 0 (
        set PYTHON_OK=1
    )
)

if !PYTHON_OK! equ 0 (
    echo [!] Python was installed but isn't working in this session yet.
    echo [!] Please restart your computer and run run.bat again.
    pause
    exit /b 1
)

echo [*] Python installed successfully!

:RUN_SCRIPT
echo.
echo [*] Running script...
echo.
python "%~dp0truestretch.py"

pause
exit /b

:RefreshPath
for /f "skip=2 tokens=3*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path') do set "SysPath=%%a %%b"
for /f "skip=2 tokens=3*" %%a in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "UserPath=%%a %%b"
set "PATH=%SysPath%;%UserPath%"
exit /b