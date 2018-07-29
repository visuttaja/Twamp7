chcp 65001
echo off
echo Tiedosto:  %~dp0%~n0%~x0
echo ********************************
echo älämölö
echo ********************************

pushd "%~dp0"
copy "wordpress.zip" ".\..\..\htdocs\" 
set path=%path%;C:\Program Files\7-Zip
cd ".\..\..\htdocs\"

7z x "wordpress.zip" -y
echo extractedted huu!
del "wordpress.zip"
popd



