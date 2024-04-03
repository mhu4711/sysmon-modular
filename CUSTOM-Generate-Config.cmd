@echo off
REM Generates a Sysmon Config XML with the 'Full' template, excluding rule definitions listed in 
REM 0_custom_configuration\exclude_rules.txt
REM
REM ATTENTION: to avoid enabling FileDelete rules (causes archiving of deleted files in C:\SYSMON), ensure
REM all files in folder 23_file_delete are listed in the exclude file!

powershell -command "& { . .\Merge-SysmonXml.ps1; Merge-AllSysmonXml -VerboseLogging -AsString -BasePath %~dp0 -ExcludeList 0_custom_configuration\exclude_rules.txt | Out-File -Encoding utf8 sysmonconfig.xml }"
