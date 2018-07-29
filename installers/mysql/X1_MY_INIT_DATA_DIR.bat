chcp 65001
echo off
echo ********************************
echo Tiedosto: %~dp0%~n0%~x0
echo älämölö
echo ********************************
echo ENTERED SETTING DATADIR

echo Searching MySQLDataDir
pushd "%~dp0"

if not exist "%mysql_data_dir%" (
echo Not Found: Now Creating MySQLDataDir
mysqld --initialize-insecure
) ELSE (
echo %mysql_data_dir% OLI JO 
pause
exit
)

popd
rem set errorlevel=1










