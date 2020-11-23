#!/bin/bash

# By default the address of LM75A is set to 0x48
# aka A0, A1, and A2 are high.
# address=0x48
address=0x4F

temp=24
hyst=20

# Check if another temp has been specified
if [ ! -z "$1" ]; then
	temp=$1
fi

# Check if another reset temp has been specified
if [ ! -z "$2" ]; then
	hyst=$2
fi

# Write Over Temp setpoint
i2cset -y 1 $address 0x03 $temp w

# Write Return to Normal setpoint
i2cset -y 1 $address 0x02 $hyst w
