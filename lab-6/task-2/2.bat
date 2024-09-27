

forfiles /p "C:\Windows" /s /m *.* /c "cmd /c if @fsize GTR 2097152 robocopy \"@path\" \"\\%HOSTNAME%\temp\@relpath\" /Z /V /LOG+:C:\Temp\copy_log.txt /R:5 /W:10"

