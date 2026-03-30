#!/bin/bash
# Script 1: System Identity Report

STUDENT_NAME="Rajveer singh"
SOFTWARE_CHOICE="Git"
current_Date="31/03/2026"

KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DATE=$(date)
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f2)

echo "===================="
echo "  Open Source Audit — $STUDENT_NAME"
echo "===================="
echo "Software: $SOFTWARE_CHOICE"
echo "Kernel  : $KERNEL"
echo "User    : $USER_NAME"
echo "Uptime  : $UPTIME"
echo "Distro  : $DISTRO"
echo "Date    : $current_DATE"
echo "License : Linux is typically licensed under GPL"
