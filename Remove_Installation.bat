pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto:  %~dp0%~n0%~x0
echo älämölö
if exist restart.lnk del restart.lnk
if exist starts.lnk del starts.lnk
if exist stop.lnk del stop.lnk

for /f "delims=" %%a IN ('dir /b /s .\htdocs\distro\*.zip') do (
 echo %%~nxa
 del "%%~fa"
)


call set_roots.bat
call set_mysql_environment.bat



rmdir %apache_distro_root%  /S /Q
rmdir %php_root%  /S /Q
rmdir "%mysql_root%\%mysql_versions_dir%\%mysql_current_version%"  /S /Q

rem rmdir /s "%siteroot%/htdocs/wordpress" /S /Q

pause
popd



