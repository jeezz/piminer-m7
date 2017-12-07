#!/bin/bash
##Installing Essentials
echo "Install script for m-cpuminer-v2,rpi-cpu.gov and piminer-start"
echo "Installing Essentials ..."
sudo apt-get update -y > /dev/null
sudo apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libgmp-dev > /dev/null

## Cloning m-cpuminer-v2
mkdir piminer
cd piminer
git clone https://github.com/magi-project/m-cpuminer-v2 > /dev/null

## building m-cpuminer-v2
echo " Building m-cpuminer-v2"
cd m-cpuminer-v2
./autogen.sh
./configure CFLAGS="-Ofast -mcpu=cortex-a53 -mfpu=crypto-neon-fp-armv8 -mfloat-abi=hard -ffast-math -mtune=cortex-a53" CXXFLAGS="-Ofast -mcpu=cortex-a53 -mfpu=crypto-neon-fp-armv8 -mfloat-abi=hard -ffast-math-mtune=cortex-a53" > /dev/null
make -j4 > /dev/null

##get piminer-start
echo "Downloading piminer-start.sh"
wget https://raw.githubusercontent.com/jeezz/piminer/master/piminer-start.sh > /dev/null
chmod +x piminer-start.sh
cd ../

## get RPi-gov
mkdir rpi-cpu.gov
cd rip-cpu.gov

echo "Cloning rpi-cpu.gov"
wget https://raw.githubusercontent.com/DavidM42/rpi-cpu.gov/master/install.sh > /dev/null
sudo chmod +x install.sh
sudo ./install.sh --nochown
sudo rm install.sh


## change CPU-Governor
read -n 1 -s -r -p "You can choose to change the CPU Governor. Please be carefull if you don't use heatspreader"
cpu.gov
cd ../
echo Check the /pminer/m-cpuminer-v2 folder and start the miner with ./piminer-start.sh
