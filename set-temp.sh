#!/bin/bash

# Raspberry Pi LM75A I2C temperature sample code.
# Author: Leon Anavi <leon@anavi.org>

# By default the address of LM75A is set to 0x48
# aka A0, A1, and A2 are set to GND (0v).
# address=0x48
address=0x4F

temp=25
hyst=20

# Check if another temp has been specified
if [ ! -z "$1" ]; then
	temp=$1
fi

# Check if another reset temp has been specified
if [ ! -z "$2" ]; then
	hyst=$2
fi

# hyst=$temp-5

# Write Over Temp setpoing
i2cset -y 1 $address 0x03 $temp w

# Write Return to Normal setpoint
i2cset -y 1 $address 0x02 $hyst w
