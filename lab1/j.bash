man bash | grep -oE '\w{4,}' | sort | uniq -c | sort -nr | head -n 3
