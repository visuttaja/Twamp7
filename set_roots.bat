title %~n0%~x0
pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto:  %~dp0%~n0%~x0
echo älämölö
echo ******************************** 
call docroot.bat

set siteroot=%cd%
set installers_root=%siteroot%\installers
echo %installers_root%
set starters_root=%siteroot%\starters
echo %starters_root%
set mysql_root=%siteroot%\mysql
echo %mysql_root%
set server_root=%siteroot%\server\httpd-2.4.34-win64-VC15
echo %server_root%

set apache_root=%siteroot%\server\httpd-2.4.34-win64-VC15\Apache24
set php_root=%siteroot%\server\php-7.2.8-Win32-VC15-x64
set apache_bin_dir=%apache_root%\bin

echo %mysql_root%
popd




