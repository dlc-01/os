for /f %%a in ('powershell -command "(Get-Date).AddMinutes(1).ToString('HH:mm')"') do (
    schtasks /create /tn "CopyFileTask" /tr "%~dp02.bat" /sc once /st %%a /f
)
