title %~n0%~x0
pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto:  %~dp0%~n0%~x0
echo älämölö
echo ******************************** 

call ".\..\..\set_roots.bat"
call "%siteroot%\set_mysql_environment.bat"

echo NYT %cd%  
title=apassinLopettaja
tasklist /v /fo csv | findstr /i "apassinLopettaja" > apassinlopettaja.txt
set /p process_properties=< apassinlopettaja.txt
echo LopettajaProsessin Tiedot: %process_properties%
echo Lopetetaan Apassi
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "tokens=2 delims=," %%G IN (apassinlopettaja.txt) DO set apapidquoted=%%G
echo apapid = %apapidquoted%
set I=%apapidquoted%
rem next line replaces " with blanks
set apapidclean=%apapidquoted:"=%
echo original %apapidquoted%
echo nyt %apapidclean%

echo %cd%

SET /P apachestoredpid=<"%siteroot%\logs\apache.pid"
echo apache httpd real pid %apachestoredpid%

SET /P consolepid=<cmd_process_pid.txt
echo console pid %consolepid%
c:\\windows\\system32\\taskkill.exe /pid %consolepid% /f 
REM pause
c:\\windows\\system32\\taskkill.exe /pid %apachestoredpid% /f 


set ignore_result=INFO:
  set counter=5
  :CHECKDEAD
  
  if %counter% lss 1 goto :OVER
  set /A counter=%counter%-1
  echo SE ON %counter%
 echo tarkistetaan että apache on deed.....(make sure that body is dead....)
    timeout /T 1
	

    for /f "usebackq" %%A in (`c:\\windows\\system32\\tasklist.exe /nh /fi "PID eq %apachestoredpid%"`) do (
      echo %%A
	  if not %%A==%ignore_result% (
	  echo Apache elossa vielä!!! Call Custer!
	  goto :CHECKDEAD)    )

:OVER

 echo it's over
 del cmd_process_pid.txt
 del cmd_process_info.txt
 del apassinlopettaja.txt
popd


