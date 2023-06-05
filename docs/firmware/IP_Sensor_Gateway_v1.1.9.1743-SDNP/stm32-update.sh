#!/bin/sh
#
# flash bin file to stm32
#
# Copyright 2018 Somfy Activites SAS
#


echo 2 > /sys/class/gpio/export
echo 5 > /sys/class/gpio/export
echo 6 > /sys/class/gpio/export
echo out > /sys/class/gpio/pioA2/direction
echo out > /sys/class/gpio/pioA5/direction
echo out > /sys/class/gpio/pioA6/direction
echo 1 > /sys/class/gpio/pioA5/value
echo 0 > /sys/class/gpio/pioA6/value
sleep 1
echo 0 > /sys/class/gpio/pioA2/value
sleep 1
echo 1 > /sys/class/gpio/pioA2/value
sleep 1
echo 0 > /sys/class/gpio/pioA5/value
echo 0 > /sys/class/gpio/pioA6/value
sleep 1
stm32flash -b 115200 -v -w /firmwares/sdnp/gateway_sdnp.bin /dev/ttyS1
sleep 1
echo 0 > /sys/class/gpio/pioA5/value
echo 0 > /sys/class/gpio/pioA6/value
echo 0 > /sys/class/gpio/pioA2/value
sleep 1
echo 1 > /sys/class/gpio/pioA2/value
sleep 2