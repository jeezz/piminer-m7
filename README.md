
# piminer
piminer is a script to install the m-cpuminer-v2 with an extra script for monitoring your RPi 3

## Requirements
Raspberry Pi 3 </br>
Raspbian stretch </br>
GCC 6 (old GCC version of raspian jessie have a nasty bug concerning the CFlags cortex-a53 is not detected) </br>


## Download: 
```shell
wget https://raw.githubusercontent.com/jeezz/piminer/master/piminer-install.sh
chmod +x piminer-install.sh
./piminer-install.sh
```


after install is done run ./piminer-start.sh from /piminer/m-cpuminer-v2 </br>
watch your temperature as mining will stress your CPU to the max!! </br>
Happy Mining!!

## Credits
https://github.com/magi-project/m-cpuminer-v2 </br>
https://github.com/DavidM42/rpi-cpu.gov
