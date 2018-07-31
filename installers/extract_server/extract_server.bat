chcp 65001
echo off
echo Tiedosto:  %~dp0%~n0%~x0
echo ********************************
echo älämölö
echo ********************************

pushd "%~dp0"

call ".\..\..\set_roots.bat"

set old_path=%path%

set path=%path;%C:\Program Files\7-Zip

pushd "%~dp0"
cd "%siteroot%\server"
echo check %cd%
rem for /f "delims=" %%a IN ('dir /b /s .\*.7z') do (

for /f "delims=" %%a IN ('dir /b /s .\*.zip') do (
rem if ZIP:
7z x %%~nxa -o* -y
rem if 7z
rem 7z x %%~nxa -y
)
popd

set path=%old_path%

popd

echo pushds nyt inside extract server after popds
pushd

echo And Cur is
echo %cd%


