echo '############ FREE MEMORY ############' 
echo 
free -m | awk  '{print $1, $3}' > ~/backups/freemem/free_mem.txt
cat ~/backups/freemem/free_mem.txt
echo
echo '############ DISK USAGE  ############'
echo 
df -h |awk {'print $1, $3'} > ~/backups/diskuse/disk_usage.txt
cat ~/backups/diskuse/disk_usage.txt 
echo 
echo '############ OPEN FILES ############'
echo
lsof > ~/backups/openlist/open_list.txt
lsof | head
echo
echo '############ FREE DISK SPACE  ############'
df -h | awk {'print $1, $4'} > ~/backups/freedisk/free_disk.txt
cat ~/backups/freedisk/free_disk.txt
