title %~n0%~x0
pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto, This File: %~dp0%~n0%~x0
echo älämölö
echo ********************************
set target_dir=J:\Twamp7_Originaali
set target=%target_dir%\twamp.zip

REM firstly, permissions must be ok for target folder.For example allow write for everyone.
REM secondly, run TwamptozipMY to collect and zip all site files.
REM then try to copy to target folder.
REM There you can extract site and start it and check if all works.

REM
call SiteSnapToZip.exe

REM echo f | automagically writes f to the prompt when xcopy asks if target is file or folder
for %%I in (.) do set CurrDirName=%%~nxI
echo %CurrDirName%

echo current folder is %cd%
echo f | xcopy .\htdocs\distro\%CurrDirName%.zip %target%  /f /i /Y /R

popd
%SystemRoot%\explorer.exe "%target_dir%"

pause





 