echo Creating admin shortcut for restarting server.
pushd "%~dp0"

powershell " $s=(New-Object -COM WScript.Shell).CreateShortcut('.\..\..\restart.lnk'); $s.TargetPath='%cd%\..\..\starters\#serverglobal\#Restart.bat'; $s.WorkingDirectory = '%cd%\..\..\';$s.Save();$bytes_str =[System.IO.File]::ReadAllBytes('.\..\..\restart.lnk');$bytes_str[0x15] = $bytes_str[0x15] -bor 0x20;[System.IO.File]::WriteAllBytes('.\..\..\restart.lnk', $bytes_str); "

 
 popd

