pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto:  %~dp0%~n0%~x0
echo älämölö
call set_roots.bat
call set_mysql_environment.bat
echo mysql_data_dir %mysql_data_dir%
echo %mysql_data_dir%
rmdir "%mysql_root%\%mysql_versions_dir%\%mysql_current_version%  /S /Q
rem rmdir "%mysql_data_dir%" /S /Q
rem rmdir /s "%siteroot%/htdocs/wordpress" /S /Q

pause
popd



