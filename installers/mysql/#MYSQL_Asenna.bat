color 1E
pushd "%~dp0"
cls
chcp 65001
echo off
COLOR 1A
echo ********************************
echo Tiedosto, This File: %~dp0%~n0%~x0
echo Tiedosto: %~dp0%~n0%~x0
echo älämölö
echo ********************************
echo pushds at start
pushd
IF "%siteroot%"=="" (
ECHO siteroot is NOT defined Exiting
pause
exit
)
echo extracting mysql
call "%installers_root%\mysql\extract_mysql.bat

call "%siteroot%/set_mysql_environment.bat"
echo MYSQL DATAFOLDER:
echo %mysql_data_dir%


IF EXIST  "%mysql_data_dir%" (
echo löytyi:
echo %mysql_data_dir%
echo MySql data-kansio on jo olemassa.
echo Jos haluat  hävittää sen,
echo voit tehdä sen  manuaalisesti,
echo kun palvelin on pois päältä.
pause
exit
) ELSE (
call X_INSTALL.bat

)

:end
popd
color 1A










