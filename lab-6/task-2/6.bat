forfiles /p "C:\Windows" /s /m *.* /c "cmd /c if @fsize GTR 2097152 (
    robocopy \"@path\" \"\\%COMPUTERNAME%\temp\@relpath\" /Z /V /LOG+:\"%~dp0copy_log.txt\" /R:5 /W:10
    fc \"@path\" \"\\%COMPUTERNAME%\temp\@relpath\"
    if errorlevel 1 (
        robocopy \"@path\" \"\\%COMPUTERNAME%\temp\@relpath\" /Z /V /LOG+:\"%~dp0copy_log.txt\" /R:5 /W:10
    )
)"
