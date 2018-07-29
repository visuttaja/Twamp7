pushd "%~dp0"
chcp 65001
echo off
echo ********************************
echo Tiedosto: %~dp0%~n0%~x0
echo älämölö
echo ********************************
echo CDIR %cd%
rem set DOCUMENT_ROOT="%siteroot%/htdocs"
rem only relative root works if path has spaces
set DOCUMENT_ROOT=./../../../../htdocs
rem next not working what ever you try
rem set DOCUMENT_ROOT="J:/TWAMP_PHP7/Yrjo Yrittaja/htdocs"
echo Docroot is:
echo %DOCUMENT_ROOT%

REM Custom document root
REM set your own directory example
REM set DOCUMENT_ROOT=D:\VBOX_ossi\ossifiilis\public
popd