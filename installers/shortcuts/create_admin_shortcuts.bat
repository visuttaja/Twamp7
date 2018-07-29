title %~n0%~x0
pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto:  %~dp0%~n0%~x0
echo älämölö
echo ******************************** 
call ".\..\..\set_roots.bat"
call "%siteroot%\set_mysql_environment.bat"


call CREATE_START_SHORTCUT.BAT
call CREATE_STOP_SHORTCUT.BAT
call CREATE_RESTART_SHORTCUT.BAT
call CREATE_WORKBENCH_SHORTCUT.BAT
call Copy_Shortcuts_To_Desktop.bat


popd
