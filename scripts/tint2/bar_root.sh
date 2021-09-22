#/bash/bin

echo -e "\U0001F5B4""$(df | awk '$1 == "/dev/sda2"' | awk '{print $6,$5}')"
