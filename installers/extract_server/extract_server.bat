chcp 65001
echo off
echo Tiedosto:  %~dp0%~n0%~x0
echo ********************************
echo älämölö
echo ********************************

pushd "%~dp0"

set path=%path%;C:\Program Files\7-Zip
cd "%siteroot%\server"

7z x ".zip" -y
popd