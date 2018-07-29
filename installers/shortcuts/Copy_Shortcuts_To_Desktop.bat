pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto: %~dp0%~n0%~x0
echo älämölö
echo ********************************
set /p ip_port=<.\..\..\ip_port.txt
set /p mysql_port=<.\..\..\mysql_port.txt
copy .\..\..\starts.lnk "%userprofile%\desktop\starts_%ip_port%_%mysql_port%.lnk" 
copy .\..\..\stop.lnk "%userprofile%\desktop\stop_%ip_port%_%mysql_port%.lnk" 
copy .\..\..\restart.lnk "%userprofile%\desktop\restart_%ip_port%_%mysql_port%.lnk" 
copy .\..\..\workbench.lnk "%userprofile%\desktop" 

popd

