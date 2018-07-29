echo ######################################
title %~n0%~x0
color 0E
chcp 65001
echo off
echo ********************************
echo Tiedosto, This File: %~dp0%~n0%~x0
echo älämölö
echo ********************************
echo CURRENT DIRECTORY
echo %cd%
echo //****************
echo mysql_data_dir
echo %mysql_data_dir%
echo mysql port:
echo %mysql_port% 
echo mysql_versions_dir:
echo %mysql_versions_dir%
echo mysql_bin_dir:
echo %mysql_bin_dir%
echo mysql_root_pw:
echo %rootpw%
echo install_my_ini:
echo %install_my_ini%
echo mysql_current_version:
echo %mysql_current_version%
echo //****************
pause


rem timeout /T 3
color 0f
echo ######################################





