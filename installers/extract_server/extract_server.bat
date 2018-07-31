chcp 65001
echo off
echo Tiedosto:  %~dp0%~n0%~x0
echo ********************************
echo älämölö
echo ********************************
echo extracting server
pushd "%~dp0"
call ".\..\..\set_roots.bat"

set old_path=%path%

SETLOCAL ENABLEDELAYEDEXPANSION
set path=%path;%C:\Program Files\7-Zip
cd "%siteroot%\server"
echo check
for /f "delims=" %%a IN ('dir /b /s .\*.zip') do (
rem if ZIP:
7z x %%~nxa -o* -y
rem if 7z
rem 7z x %%~nxa -y
)

set path=%old_path%
popd