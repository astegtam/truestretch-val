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

:: --- Check if Python is installed ---
where python >nul 2>&1
if %errorLevel% equ 0 (
    echo [*] Python found, continuing...
    goto RUN_SCRIPT
)

echo [*] Python not found. Downloading and installing...
echo [*] This may take a few minutes, please wait...

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

:: --- Silent install (adds Python to PATH automatically) ---
echo [*] Installing Python...
"%INSTALLER%" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

:: --- Clean up the installer file ---
del "%INSTALLER%"

:: --- Short wait for PATH update ---
timeout /t 5 /nobreak >nul

:: --- Refresh PATH for this session ---
call :RefreshPath

where python >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Python was installed but PATH hasn't updated yet.
    echo [!] Please restart your computer and run run.bat again.
    pause
    exit /b 1
)

echo [*] Python installed successfully!

:RUN_SCRIPT
echo.
echo [*] Running script...
echo.
python "%~dp0truestretch.py

pause
exit /b

:RefreshPath
for /f "skip=2 tokens=3*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path') do set "SysPath=%%a %%b"
for /f "skip=2 tokens=3*" %%a in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "UserPath=%%a %%b"
set "PATH=%SysPath%;%UserPath%"
exit /b