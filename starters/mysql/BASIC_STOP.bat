title %~n0%~x0
color 1D
pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto: %~dp0%~n0%~x0
echo älämölö
echo ********************************
echo BASIC STOP

rem huomaa että on pakko käyttää suhteelista 
rem viittausta tässä yhteydessä
rem koska rootseja ei välttämättä ole vielä tehty
call ".\..\..\set_roots.bat"

call "%siteroot%\set_mysql_environment.bat"

echo Halting mysql_server.... %cd%
set /P MIUNPID=<mysqlpid.txt
echo WORKING on %MIUNPID%

rem kun winkun kieli on englanti
set lopetusvarmistus_mysql=INFO:
rem win palvelimen kielestä riippuu fluent quits
rem set lopetusvarmistus_mysql=TIETOJA:

mysqladmin --port %mysql_port% -u root -p%rootpw% shutdown



 rem pakko vahtia
   rem suomenkielisess�
    rem set ignore_result=TIETOJA:
 rem englanninkielisess�
   rem set ignore_result=INFO:
    echo LOPETUSVARMISTUSSANA on %lopetusvarmistus_mysql%
	rem pause
  set counter=30

  :CHECKDEAD
  echo %counter%
   if %counter% lss 1 goto :OVER
  set /A counter=%counter%-1
 echo tarkistetaan että mysqld on dööd.....(make sure that body is dead....)
    TIMEOUT /T 1
	
	   for /f "usebackq" %%A in (`c:\\windows\\system32\\tasklist.exe /nh /fi "PID eq %MIUNPID%"`) do (
      echo %%A
	  if not %%A==%lopetusvarmistus_mysql% (
	  echo EI OLE dödannu VIELÄ!!! It's moving ..... it's still moving!
	  goto :CHECKDEAD)    )
:OVER
	  
	   echo heippa

 

echo MYSQL should have gone now....?!

rem TIMEOUT /T 2


popd
color 1A


