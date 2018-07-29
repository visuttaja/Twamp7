echo Starting Workbench....
echo Tiedosto:  %cd%\%~n0%~x0
echo ********************************
pushd "%~dp0"

call .\..\..\..\mysql_workbench\MySQLWorkbench.exe
popd