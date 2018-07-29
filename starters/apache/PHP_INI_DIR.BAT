pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto: %~dp0%~n0%~x0
echo älämölö
echo ********************************

rem starts at apache bin dir
rem huomaa apachen sisäiset etukenot
set PHP_INI_DIR="./../../../../"


REM Custom PHP.ini dir

popd