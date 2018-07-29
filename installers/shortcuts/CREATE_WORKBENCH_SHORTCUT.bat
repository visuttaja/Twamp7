echo Creating admin shortcut for mysqlworkbench.
pushd "%~dp0"

powershell " $s=(New-Object -COM WScript.Shell).CreateShortcut('.\..\..\workbench.lnk'); $s.TargetPath='%cd%\..\..\starters\mysqlworkbench\#Start_Workbench.bat'; $s.WorkingDirectory = '%cd%\..\..\';$s.Save();$bytes_str =[System.IO.File]::ReadAllBytes('.\..\..\workbench.lnk');$bytes_str[0x15] = $bytes_str[0x15] -bor 0x20;[System.IO.File]::WriteAllBytes('.\..\..\workbench.lnk', $bytes_str); "

 
 popd

