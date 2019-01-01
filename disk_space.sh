#!/bin/bash
##This Script Created and configured by Javid Alizade
LINE=$(df -h | head -n 2 | tail -n 1 | awk '//{print $5}')
COUNT="90%"
if [[ "$LINE" > "$COUNT" ]]; then
du -ch --exclude=/proc --exclude=/bckp --exclude=/run --max-depth=10 / | grep '[0-9]G\>' | awk '/[0-9]{3}/{print $0}' > /root/MAX_SIZE_FILE && mailx -s "$HOSTNAME critical disk alert" javid.alizade@linuxazerbaijan.az < /root/MAX_SIZE_FILE
else
du -ch --exclude=/proc --exclude=/bckp --exclude=/run --max-depth=10 / | grep '[0-9]G\>' | awk '/[0-9]{2}/{print $0}' > /root/CURRENT_SIZE_FILE && mailx -s "$HOSTNAME Current disk space is $LINE" javid.alizade@linuxazerbaijan.az < /root/CURRENT_SIZE_FILE
fi
