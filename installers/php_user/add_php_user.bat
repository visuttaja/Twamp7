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

pushd "%~dp0"
set uusi_user="php"
set uusi_user_pw="pww"


echo tässä pysäytys

call "%starters_root%\mysql\BASIC_START.bat"

set tietokannan_nimi=mysql

echo tietokannan_nimi  %tietokannan_nimi%
echo portti %mysql_port% 
echo %rootpw%

echo Creating user php IF not exists you see error first.it is ok.

mysql --port %mysql_port% -uroot -p%rootpw% --execute="drop user '%uusi_user%'@'localhost';"
mysql --port %mysql_port% -uroot -p%rootpw%  --execute="flush privileges;"
mysql --port %mysql_port% -uroot -p%rootpw%  --execute="CREATE USER '%uusi_user%'@'localhost' IDENTIFIED BY '%uusi_user_pw%';"


mysql --port %mysql_port% -uroot -p%rootpw%  --execute="USE %tietokannan_nimi%;"
mysql --port %mysql_port% -uroot -p%rootpw% --execute="GRANT ALL ON %tietokannan_nimi%.* TO '%uusi_user%'@'localhost';"

call "%starters_root%\mysql\BASIC_STOP.bat"

popd
popd

color 0A









