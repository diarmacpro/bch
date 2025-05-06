#!/bin/bash

echo "===== System Information ====="
echo "Hostname       : $(hostname)"
echo "Uptime         : $(uptime -p)"
echo "OS             : $(source /etc/os-release && echo "$PRETTY_NAME")"
echo "Kernel         : $(uname -r)"
echo "Architecture   : $(uname -m)"
echo "Virtualization : $(systemd-detect-virt)"

echo ""
echo "===== CPU Info ====="
lscpu | grep -E 'Model name|Socket|Thread|Core|CPU\(s\):'

echo ""
echo "===== Memory Info ====="
free -h

echo ""
echo "===== Disk Info ====="
df -h --total | grep -E '^Filesystem|total'

echo ""
echo "===== Network Info ====="
ip route get 1.1.1.1 | awk '{for(i=1;i<=NF;i++){if($i=="dev"){print "Interface       : " $(i+1)}}}'
ip -o -4 addr show | awk '{print "IP Address      : " $4}'

echo ""
echo "===== End of Report ====="
