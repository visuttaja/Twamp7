title %~n0%~x0
pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto, This File: %~dp0%~n0%~x0
echo älämölö
echo ********************************

echo ENTERED setting basic MYSQL Environment variables:

set /P mysql_port=<mysql_port.txt
set /P rootpw=<mysql_root_pw.txt
set mysql_versions_dir=mysql32
set mysql_current_version=mysql32_5_7_17

rem  set mysql_data_dir="%mysql_root%\mysql32\mysql32_5_7_17\data"

rem //*******************BEEF here
set mysql_data_dir=%mysql_root%\%mysql_versions_dir%\%mysql_current_version%\data
rem set mysql_data_dir=J:\data
rem //***************
set mysql_bin_dir=%mysql_root%\%mysql_versions_dir%\%mysql_current_version%\bin

set mysql_bin_dir=%mysql_root%\%mysql_versions_dir%\%mysql_current_version%\bin
set path=%path%;%mysql_bin_dir%

set install_my_ini="%installers_root%\mysql\y_my_first.ini"

popd
echo pushds after
pushd






