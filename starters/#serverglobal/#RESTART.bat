echo off
echo Tiedosto:  %~dp0%~n0%~x0
echo ********************************
pushd "%~dp0"
call #STOP.bat
echo Restarting
rem timeout /t 4
call #STARTS.bat
popd


