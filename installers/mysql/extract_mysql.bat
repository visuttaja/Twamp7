chcp 65001
echo off
echo Tiedosto:  %~dp0%~n0%~x0
echo ********************************
echo älämölö
echo ********************************
echo extracting mysql
rem call .\..\..\set_roots.bat
pushd "%~dp0"
set old_path=%path%

set path=%path%;"C:\Program Files\7-Zip"

cd "%siteroot%\mysql\mysql32"

for /f "delims=" %%a IN ('dir /b /s .\*.7z') do (
7z x %%~nxa -y
)


set path=%old_path%

popd