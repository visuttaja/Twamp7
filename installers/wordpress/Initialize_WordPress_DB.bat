
chcp 65001
echo off
pushd "%~dp0"
echo ********************************
echo Tiedosto:  %~dp0%~n0%~x0
echo älämölö
echo ********************************


echo tietokannan_nimi  %tietokannan_nimi %
echo portti %portti%

mysql  --port %mysql_port% -uroot -p%rootpw%  --execute="DROP DATABASE %tietokannan_nimi%;"
mysql --port %mysql_port% -uroot -p%rootpw%  --execute="CREATE DATABASE %tietokannan_nimi%;"
mysql --port %mysql_port% -uroot -p%rootpw%  --execute="CREATE USER '%kayttajan_nimi%'@'localhost' IDENTIFIED BY '%kayttajan_salasana%';"
mysql --port %mysql_port% -uroot -p%rootpw%  --execute="USE %tietokannan_nimi%;"
mysql --port %mysql_port% -uroot -p%rootpw% --execute="GRANT ALL ON %tietokannan_nimi%.* TO '%kayttajan_nimi%'@'localhost';"

popd
echo end wp_db




