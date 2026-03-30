#!/bin/bash
# Script 5: Open Source Manifesto Generator

read -p "Tool you use: " TOOL
read -p "Freedom means: " FREEDOM
read -p "What would you build: " BUILD

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto.txt"

echo "On $DATE, I reflect on open source." > $OUTPUT
echo "Using $TOOL daily reminds me that software freedom means $FREEDOM." >> $OUTPUT
echo "I aspire to build $BUILD and share it openly with the world." >> $OUTPUT

echo "Saved to $OUTPUT"
cat $OUTPUT
