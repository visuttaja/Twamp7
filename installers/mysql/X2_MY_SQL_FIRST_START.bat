chcp 65001
echo off
echo ********************************
echo Tiedosto: %~dp0%~n0%~x0
echo älämölö
echo ********************************
pushd "%~dp0"
echo HAKEMISTO nyt
echo %cd%
set initfile="%cd%\install_initfile.txt"

call start  "MYSQL" mysqld --port=%mysql_port%  --log-timestamps=SYSTEM --standalone --console --init-file=%initfile%  --explicit_defaults_for_timestamp

mysqladmin --port %mysql_port% -u root password %rootpw%

rem wait 1 sec
timeout /T 1

REM get real mysqld pid

FOR /F "usebackq" %%A IN (`hostname`) DO SET HOST=%%A
 set pidfilename=%HOST%.pid 

set pid_filepath="%mysql_data_dir%\%pidfilename%"
for %%f in (%pid_filepath%) do set pid_path=%%~ff
echo MySql PID-path
echo %pid_path%
set /P MYSQLDPID=<%pid_filepath%
echo MYSQLDPID on  %MYSQLDPID%

>mysqlpid.txt echo(%MYSQLDPID%

hostname
rem TIMEOUT /T 2

popd





