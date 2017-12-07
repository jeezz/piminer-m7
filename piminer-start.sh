#!/bin/bash
# Raspberry Pi Mining Monitor Version 0.1
# Happy Hashing!!
# Exit Trap. Kill all child processes on exit eg. STRG+C
trap "exit" INT TERM
trap "kill 0" EXIT

# Start miner in background  reporting hashrate and fround shares to syslog
# add you miner config here
# -o [your stratum pool] -u [user.workerID] -p [password]
./minerd -a m7mhash -o stratum+tcp://xmg.suprnova.cc:7128 -u jeezz.Pi -p x -S -q &

# loop
echo "Miner Started. Wait 1 minute to get proper results"
echo "This script will show you your current CPU Speed,CPU Temp and Hashrate"
echo "Please keep in mind that as long as the Miner did not sind a Share the script will not report any Hahsrate or Lastshare"
echo "Hahsrate and Lastshare are the last value reported by the miner in /var(log/syslog"
grep stratum+tcp /var/log/syslog | tail -n 1 | cut -d" " -f7-
sleep 60;
while true; do echo -n

# variables
MHZ=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
TEMPE=$(cat /sys/class/thermal/thermal_zone0/temp)
TEMPS=$'\xc2\xb0'C
DATE=$(date)
LASTSHARE=$(grep yay /var/log/syslog | tail -n 1 | cut -d" " -f4)
HASH=$(grep yay /var/log/syslog | tail -n 1 | cut -d" " -f10)

# output goes here
echo $DATE "|" CPU Speed $(($MHZ/1000)) Mhz "|" CPU Temp $(($TEMPE/1000)) $TEMPS "|" Hashrate $HASH kH/s "|" Lastshare $LASTSHARE

# loop wait time in sec
sleep 30;
done
