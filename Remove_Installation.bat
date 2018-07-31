@echo off

:: BatchGotAdmin (Run as Admin code starts)
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (

    echo Requesting administrative privileges...
    pause
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:: BatchGotAdmin (Run as Admin code ends)

@echo off
:: Article: http://www.techgainer.com/create-batch-file-automatically-run-administrator
:: Your code starts from here

pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto:  %~dp0%~n0%~x0
echo älämölö
if exist restart.lnk del restart.lnk
if exist starts.lnk del starts.lnk
if exist stop.lnk del stop.lnk

for /f "delims=" %%a IN ('dir /b /s .\htdocs\distro\*.zip') do (
 echo %%~nxa
 del "%%~fa"
)


call set_roots.bat
call set_mysql_environment.bat



rmdir %apache_distro_root%  /S /Q
rmdir %php_root%  /S /Q
rmdir "%mysql_root%\%mysql_versions_dir%\%mysql_current_version%"  /S /Q

rem rmdir /s "%siteroot%/htdocs/wordpress" /S /Q

pause
popd



