echo ______________________________________________
title %~n0%~x0
color 4b
pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto:  %~dp0%~n0%~x0
echo älämölö
echo ********************************
rem huomaa että on pakko käyttää suhteelista 
rem viittausta tässä yhteydessä
rem koska rootseja ei välttämättä ole vielä tehty
call ".\..\..\set_roots.bat"

call "%siteroot%\set_mysql_environment.bat"
echo PISTE

rem echo %mysql_data_dir%

IF NOT EXIST  "%mysql_data_dir%" (
echo MySql data-kansio puuttuu.
echo MySql pitäisi alustaa.

exit
) ELSE (
echo MYSQL DATA FOLDER found!:
echo %mysql_data_dir%
)


set my_ini="%siteroot%\my.ini"
ECHO MYSQL PORT IS %mysql_port%
Echo my.ini on %my_ini%
color 1A
rem delete old pid


call start "MYSQL" mysqld --defaults-file=%my_ini% --port=%mysql_port%  --standalone --console --log-timestamps=SYSTEM --explicit_defaults_for_timestamp  --verbose

 


rem wait 1 secs
timeout /t 1

REM get real mysqld pid

FOR /F "usebackq" %%A IN (`hostname`) DO SET HOST=%%A
 set pidfilename=%HOST%.pid
 
set pid_filepath="%mysql_data_dir%\%pidfilename%"
echo %pid_filepath%
set /P MYSQLDPID=<%pid_filepath%
echo MYSQLDPID on  %MYSQLDPID%


IF "%MYSQLDPID%"=="" (
ECHO Variable MYSQLDPID is NOT defined, MYSQL is not running
pause
exit
)



color 0A

>mysqlpid.txt echo(%MYSQLDPID%

hostname

timeout /T 2

popd
color 1A
echo _____BASIC START DONE_________________



