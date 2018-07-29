echo Creating admin shortcut for stoping server.
pushd "%~dp0"

powershell " $s=(New-Object -COM WScript.Shell).CreateShortcut('.\..\..\stop.lnk'); $s.TargetPath='%cd%\..\..\starters\#serverglobal\#Stop.bat'; $s.WorkingDirectory = '%cd%\..\..\';$s.Save();$bytes_str =[System.IO.File]::ReadAllBytes('.\..\..\stop.lnk');$bytes_str[0x15] = $bytes_str[0x15] -bor 0x20;[System.IO.File]::WriteAllBytes('.\..\..\stop.lnk', $bytes_str); "

 
 popd

