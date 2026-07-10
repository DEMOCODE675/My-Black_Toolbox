#!/bin/bash

#clear the screen for a clean look
clear
echo "======================================================="
echo "               MY AUTOMATED NETWORK AUDIT TOOL                                                                             "
echo "======================================================="


#       Automatically grab your current local IP addreass
LOCAL_IP = $(HOSTNAME -I | awk '{print $1}')
echo  "[+] Your Current Machine IP : $LOCAL_IP "

echo "--------------------------------------------------------------------------------------------"
# ask user  for the target IP to  scan 

read -p "Enter the target IP you want to scan :  " TARGET

echo "---------------------------------------------------------------------------------------"
echo "[*] Launching full-range stealth scan on $TARGET..."
echo "[*] Checking all 65,535 ports. Please wait..."
echo "------------------------------------------------------------------------------------------------------"


#Execute  the deep Nmap scan

sudo nmap -p- --open -v $TARGET

echo "========================================================"

sudo nmap -sV -F $TARGET

echo "======================================================="

sudo nmap -sV -p 80,443,8080,8899 $TARGET

echo "======================================================="
echo "-------------------------------------------------------------------------------------------"
echo "[+]  Sccan complete sucessfully1"
echo "================================================================"
