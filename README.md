
# piminer
piminer is a script to install the m-cpuminer-v2 with an extra script for monitoring your RPi 3

## Requirements
Raspberry Pi 3
Raspbian stretch
GCC 6 (old GCC version of raspian jessie have a nasty bug concerning the CFlags cortex-a53 is not detected)


## Download: 
```shell
wget https://raw.githubusercontent.com/jeezz/piminer/master/piminer-install.sh
```

run the script with ./piminer-install.sh
after install is done run ./piminer-start.sh from /piminer/wolf-m7m-cpuminer
watch your temperature as mining will stress your CPU to the max!!

Happy Mining!!

## Credits

wolf-m7m-miner from: https://github.com/novaspirit/wolf-m7m-cpuminer
rpi-cpu.gov from: https://github.com/DavidM42/rpi-cpu.gov
