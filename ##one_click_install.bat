echo off
color 1A
pushd "%~dp0"
if exist restart.lnk del restart.lnk
if exist start.lnk del start.lnk
if exist stop.lnk del stop.lnk

 rem call SiteSnapToZip.exe
call set_roots.bat

echo extracting server
call "%installers_root%\extract_server\extract_server.bat
call "%installers_root%\mysql\extract_mysql.bat

echo Installing MYSQL
 call "%installers_root%\mysql\#MYSQL_Asenna.bat"
 echo Installing MYSQL DONE
 echo Installing PHP user
 call "%installers_root%\php_user\add_php_user.bat"
 echo Installing PHP user DONE
 
 echo Installing shortcuts
 call "%installers_root%\shortcuts\create_admin_shortcuts.bat"
 echo Installing shortcuts DONE

 call "%installers_root%\wordpress\#WordPress_Install.bat"


echo done so much..
echo %cd%

call starts.lnk
popd
color 1A






