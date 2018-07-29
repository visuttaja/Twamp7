pushd "%~dp0"
if exist restart.lnk del restart.lnk
if exist start.lnk del start.lnk
if exist stop.lnk del stop.lnk

call start SiteSnapToZip.exe

