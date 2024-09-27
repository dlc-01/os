sc stop dnscache
timeout /t 10
sc query state= all > services_list_after.txt
call compare_services.bat
sc start dnscache
fc services.txt services_updated.txt > services_diff.txt