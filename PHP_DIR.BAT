pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto: %~dp0%~n0%~x0
echo älämölö
echo ********************************
set PHP_DIR=./../../../php-7.2.8-Win32-VC15-x64
rem set PHP_DIR=%siteroot%\apache\sroot\phpbinarie\php-5.6.30-Win32-VC11-x64
REM set PHP_DIR=%cd%\sroot\phpbinarie\php-7.1.3-Win32-VC14-x64
rem set PHP_DIR=%siteroot%\php\php-5.6.30-Win32-VC11-x64


REM Custom PHP.ini dir
REM set your own directory example
REM set DOCUMENT_ROOT=D:\VBOX\public\phpsetup
popd