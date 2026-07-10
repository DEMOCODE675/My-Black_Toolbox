#!/bin/bash

clear
echo "================================================"
echo "					WI-FI LIVE INTRUDER TRACKER 						"
echo "====================================================="


#1   Get your network range dynamically (e.g., extracts  192.168.... from your IP)

SUBNET=$(hostname -I | awk '{print $1}' | cut -d. -f1-3)
echo "[+] detected your wi-fi network base: $SUBNET.X"

echo "[*] scanning all 254 potential devices.. please wait.."
echo "--------------------------------------------"
echo "IP Address                   |  Status"
echo "-------------------------------------------"

#2  the FOR Loop: count from 1 to 254 to check every single IP slot 
for host in {1..254} do
do
	#Ping  each IP exactly 1 time , wating only 0.2sce for a reply
	ping -c 1 -w 1 "$SUBNET.$host" > /dev/null 2>&1
	
	#if the ping was sucessfull, the device is active!
	if [ $? -eq 0 ]; then 
		echo "--> $SUBNET.$host | [ ACTIVE DEVICE ]"
	fi
done

echo "==============================="
echo "[=] wi-fi MAp Completed       "
echo "==============================="
