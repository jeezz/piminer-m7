#!/bin/bash
##Installing Essentials
echo " Installing Essentials ..."
sudo apt-get update -y > /dev/null
sudo apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libgmp-dev > /dev/null

## Cloning Wolf-m7m-cpuminer
mkdir piminer
cd piminer
git clone https://github.com/novaspirit/wolf-m7m-cpuminer

## building Wold-m7m-miner
cd wolf-m7m-cpuminer
./autogen.sh
./configure CFLAGS="mfpu=neon-vfpv4"
sed -i -e 's/-march=native/-mcpu=cortex-a53/g' Makefile
sed -i -e 's/-march=native/-mcpu=cortex-a53/g' /m7/Makefile
make -j4

## get RPi-gov
wget https://raw.githubusercontent.com/DavidM42/rpi-cpu.gov/master/install.sh
sudo chmod +x install.sh
sudo ./install.sh --nochown
sudo rm install.sh

##get piminer-start
wget https://raw.githubusercontent.com/jeezz/piminer/master/piminer-start.sh
chmod +x piminer.sh

## change CPU-Governor
read -n 1 -s -r -p "You can coose to change the CPU Governor. Please be carefull if you don't use heatspreader"
cpu.gov
echo Start the miner with ./piminer-start.sh
