
echo Creating admin shortcut for starting server.
pushd "%~dp0"

powershell " $s=(New-Object -COM WScript.Shell).CreateShortcut('%siteroot%\starts.lnk'); $s.TargetPath='%starters_root%\#serverglobal\#Starts.bat'; $s.WorkingDirectory = '%siteroot%';$s.Save();$bytes_str =[System.IO.File]::ReadAllBytes('%siteroot%\starts.lnk');$bytes_str[0x15] = $bytes_str[0x15] -bor 0x20;[System.IO.File]::WriteAllBytes('%siteroot%\starts.lnk', $bytes_str); "

 popd

