color 1A
echo off
chcp 65001
echo Tiedosto:  %~dp0%~n0%~x0
echo ********************************
echo Starting Server....

pushd "%~dp0"
call ".\..\..\set_roots.bat"
call "%siteroot%\set_mysql_environment.bat"
popd
pushd "%~dp0"
call "%starters_root%\mysql\basic_start.bat"
popd
pushd "%~dp0"
call "%starters_root%\apache\start_apache.bat"
popd
echo now open browser
pause

rem wait 4 secs
timeout /t 4






