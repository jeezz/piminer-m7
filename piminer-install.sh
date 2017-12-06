#!/bin/bash
##Installing Essentials
echo "Installing Essentials ..."
sudo apt-get update -y > /dev/null
sudo apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libgmp-dev > /dev/null

## Cloning Wolf-m7m-cpuminer
mkdir piminer
cd piminer
git clone https://github.com/novaspirit/wolf-m7m-cpuminer > /dev/null

## building Wold-m7m-miner
echo " Building wolf-m7m-miner"
cd wolf-m7m-cpuminer
./autogen.sh
./configure CFLAGS="-mfpu=neon-vfpv4" > /dev/null
sed -i -e 's/-march=native/-mcpu=cortex-a53/g' Makefile
sed -i -e 's/-march=native/-mcpu=cortex-a53/g' m7/Makefile
make -j4 > /dev/null

## get RPi-gov
echo "Cloning rpi-cpu.gov"
wget https://raw.githubusercontent.com/DavidM42/rpi-cpu.gov/master/install.sh > /dev/null
sudo chmod +x install.sh
sudo ./install.sh --nochown
sudo rm install.sh

##get piminer-start
echo "Downloading piminer-start.sh"
wget https://raw.githubusercontent.com/jeezz/piminer/master/piminer-start.sh > /dev/null
chmod +x piminer-start.sh

## change CPU-Governor
read -n 1 -s -r -p "You can coose to change the CPU Governor. Please be carefull if you don't use heatspreader"
cpu.gov
echo Check the /pminer/wolf-m7m-cpuminer folder and start the miner with ./piminer-start.sh
