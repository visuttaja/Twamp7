echo off
color 1A
pushd "%~dp0"
pushd

if exist restart.lnk del restart.lnk
if exist starts.lnk del start.lnk
if exist stop.lnk del stop.lnk

rem call SiteSnapToZip.exe
call set_roots.bat

call "%installers_root%\mysql\extract_mysql.bat
 echo extracting mysql DONE
 echo cur %cd%
 pushd
      timeout /T 2
      rem pause



echo Installing MYSQL
 call "%installers_root%\mysql\#MYSQL_Asenna.bat"
 echo Installing MYSQL DONE
 echo cur %cd%
 pushd
timeout /T 2
      rem pause

 echo Installing PHP user
 call "%installers_root%\php_user\add_php_user.bat"
 echo Installing PHP user DONE
 echo cur %cd%
 pushd
timeout /T 2
    rem  pause

echo extracting server
call "%installers_root%\extract_server\extract_server.bat"
echo extracting server DONE
  echo cur %cd%
   pushd
   timeout /T 2
   rem   pause

echo Installing shortcuts
 call "%installers_root%\shortcuts\create_admin_shortcuts.bat"
 echo Installing shortcuts DONE
 echo cur %cd%
 pushd
 timeout /T 2
      rem pause


 call "%installers_root%\wordpress\#WordPress_Install.bat"
 echo extracting WordPress DONE
 echo cur %cd%
 pushd
     timeout /T 2
     rem pause

echo done so much..

echo starting
echo CUR %cd%
pushd




pushd "%~dp0"
start starts.lnk
timeout /t 4
start "" http://localhost

popd

color 1A






