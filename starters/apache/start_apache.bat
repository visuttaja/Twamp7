title %~n0%~x0
pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto:  %~dp0%~n0%~x0
echo älämölö
echo ******************************** 

echo cd on %cd%
call ".\..\..\set_roots.bat"
call "%siteroot%\set_mysql_environment.bat"
set document_root as variable
call "%siteroot%\DOCROOT.bat"
echo DOCUMENT_ROOT
echo %DOCUMENT_ROOT%

set MODULES_DIR=./../modules

rem also set php.ini directory
call "PHP_INI_DIR.BAT"
echo PHP_INI_DIR:
echo %PHP_INI_DIR%
rem pause
call "%siteroot%\PHP_DIR.BAT"
echo PHP DIR ON: %PHP_DIR%
echo %cd%
rem pause

set /p HTTP_PORT=<"%siteroot%\IP_PORT.txt"

title=apache_dos_window
tasklist /v /fo csv | findstr /i "apache_dos_window" > cmd_process_info.txt
set /p process_info=<cmd_process_info.txt
echo CMD Prosessin Tiedot: %process_info%


rem grab the pid from tasklist line
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "tokens=2 delims=," %%G IN (cmd_process_info.txt) DO set cmd_pid_quoted=%%G
echo apapid = %cmd_pid_quoted%

REM next line replaces " with blanks
set cmd_process_pid=%cmd_pid_quoted:"=%
echo original %cmd_pid_quoted%
echo nyt %cmd_process_pid%
echo ******************************

rem must set title again to unique 
rem in case any other servers on other ports
title=This Apache CMD pid: %cmd_process_pid%


REM nyt pid on muotoa 1234
>cmd_process_pid.txt echo(%cmd_process_pid%

COLOR 4e


set SYSDIRS=c:\windows\system32;c:\windows


set PATH=%apache_bin_dir%;%SYSDIRS%;%PHP_DIR%;%PATH%
pushd "%~dp0"
cd %apache_bin_dir%
rem call httpd -f  "%cd%/../../httpd.conf"
call httpd -f  "%siteroot%/httpd.conf"
popd
popd
