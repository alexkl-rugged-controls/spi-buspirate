#!/bin/bash

make clean
make
sudo insmod spi-buspirate.ko
sudo ldattach GIGASET /dev/ttyUSB0
sleep 5
echo spidev | sudo tee /sys/bus/spi/devices/spi0.0/driver_override
echo spi0.0 | sudo tee /sys/bus/spi/drivers/spidev/bind
sudo chown alex:alex /dev/spidev0.0
sudo dmesg -w
