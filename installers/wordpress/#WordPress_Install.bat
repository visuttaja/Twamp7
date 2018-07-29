title %~n0%~x0
color 84
chcp 65001
echo off
pushd "%~dp0"
echo ********************************
echo Tiedosto:  %~dp0%~n0%~x0
echo älämölö
echo ********************************
call ".\..\..\set_roots.bat"
call "%siteroot%\set_mysql_environment.bat"

if not exist "%mysql_data_dir%" ( 
echo MySql Data-hakemistoa ei ole.
echo Alusta MySql.Poistutaan.
pause
exit
) ELSE (
echo JOO 
)

chcp 65001
COLOR 1A

call SET_WORDPRESS_FOLDER.bat

IF EXIST  %wp_kansio% (
echo löytyi:
echo %wp_kansio%
echo wordpress-kansio  on jo olemassa
echo  jos haluat  hävittää sen,
echo voit tehdä sen  manuaalisesti,
echo kun palvelin on pois päältä
GOTO end
) ELSE (


call WORDPRESS_Creds.bat


call "%starters_root%\mysql\BASIC_START.bat"

rem luo pelkän skeeman
call Initialize_WordPress_DB.bat


call "%starters_root%\mysql\BASIC_STOP.bat"

call Extract_WordPress_Zip.bat

pushd
)

:end


popd






