@echo off

:: BatchGotAdmin (Run as Admin code starts)
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
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

echo off
color 1A
pushd "%~dp0"
pushd

if exist restart.lnk del restart.lnk
if exist starts.lnk del start.lnk
if exist stop.lnk del stop.lnk

call SiteSnapToZip.exe
call set_roots.bat

call "%installers_root%\mysql\extract_mysql.bat
 echo extracting mysql DONE
 echo cur %cd%
 pushd
      timeout /T 2
      rem pause



echo Installing MYSQL
 call "%installers_root%\mysql\#MYSQL_Asenna.bat"
 echo Installing MYSQL DONE
 echo cur %cd%
 pushd
timeout /T 2
      rem pause

 echo Installing PHP user
 call "%installers_root%\php_user\add_php_user.bat"
 echo Installing PHP user DONE
 echo cur %cd%
 pushd
timeout /T 2
    rem  pause

echo extracting server
call "%installers_root%\extract_server\extract_server.bat"
echo extracting server DONE
  echo cur %cd%
   pushd
   timeout /T 2
   rem   pause

echo Installing shortcuts
 call "%installers_root%\shortcuts\create_admin_shortcuts.bat"
 echo Installing shortcuts DONE
 echo cur %cd%
 pushd
 timeout /T 2
      rem pause


 call "%installers_root%\wordpress\#WordPress_Install.bat"
 echo extracting WordPress DONE
 echo cur %cd%
 pushd
     timeout /T 2
     rem pause

echo done so much..

echo starting
echo CUR %cd%
pushd




pushd "%~dp0"
start starts.lnk
timeout /t 4
start "" http://localhost

popd

color 1A






