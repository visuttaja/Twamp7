chcp 65001
echo off
echo Tiedosto:  %~dp0%~n0%~x0
echo ********************************
echo älämölö
echo ********************************
echo extracting server
rem call .\..\..\set_roots.bat
pushd "%~dp0"
set old_path=%path%

SETLOCAL ENABLEDELAYEDEXPANSION
set path=%path;%C:\Program Files\7-Zip
cd "%siteroot%\server"

for /f "delims=" %%a IN ('dir /b /s .\*.7z') do (
rem if ZIP:
rem 7z x %%~nxa -o* -y
rem if 7z
7z x %%~nxa -y
)

set path=%old_path%
popd