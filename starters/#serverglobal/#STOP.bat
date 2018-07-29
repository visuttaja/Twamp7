chcp 65001
echo Tiedosto:  %cd%\%~n0%~x0
echo ********************************
echo Halting server.... %cd%

pushd "%~dp0"
call ".\..\..\set_roots.bat"
call "%siteroot%\set_mysql_environment.bat"
popd
pushd "%~dp0"
call "%starters_root%\mysql\basic_stop.bat"
popd

pushd "%~dp0"
call "%starters_root%\apache\stop_apache.bat"
popd

 


