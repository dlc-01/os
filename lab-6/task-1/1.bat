mkdir C:\LAB6
cd C:\LAB6
ver > ver.txt
systeminfo | findstr /C:"Available Physical Memory" /C:"Total Physical Memory" > mem.txt
wmic logicaldisk get name, freespace, size > C:\LAB6\drives.txt