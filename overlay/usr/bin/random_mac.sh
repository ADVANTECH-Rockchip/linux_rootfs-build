#!/bin/bash

MACAddr="3C:8D:20"
INTERFACE="enp1s0"

function gen_2byte(){
  ret=$(cat /dev/urandom | tr -dc '0-9a-f' | fold -w 2 | head -n 1)
  echo $ret
}

function gen_MACAddr(){
	
	
for (( c = 1; c<= 2; c++ ))
do
	tmp=$(gen_2byte)
	MACAddr=$MACAddr":"$tmp

done
	echo "Generated MAC Address: "$MACAddr
}

function Set_MACAddr(){
	
	ifconfig $1 down 
	ifconfig $1 hw ether $MACAddr
	ifconfig $1 up 
	
} 

function main(){
	gen_MACAddr
	Set_MACAddr $INTERFACE $MACAddr
	udhcpc -i $INTERFACE
	IPAddr=$(ifconfig $INTERFACE | grep inet | awk '{ print $2'})
	echo -e "\e[91m" 
	echo "IP Address: "$IPAddr
	echo -e "\e[39m" 
}

main $@

