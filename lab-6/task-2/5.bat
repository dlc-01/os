for /f "tokens=*" %%A in ('findstr /i /c:"New File" %~dp0copy_log.txt') do (
    for /f "tokens=2 delims=> " %%B in ("%%A") do (
        fc "%%B" "\\%COMPUTERNAME%\temp\%%~nxB"
    )
)
