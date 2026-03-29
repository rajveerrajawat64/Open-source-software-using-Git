# Open-source-software-using-Git
it uses Git v2 to run 5 linux scripts
#!/bin/bash
# Script 1: System Identity Report
# Author: Rajveer Singh | Course: Open Source Software

#  Variables 
STUDENT_NAME="Rajveer Singh"
SOFTWARE_CHOICE="Git"

#  System info 
KERNEL=$(uname -r)
DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(30/03/2026)

# Display 
echo ""
echo " Open Source Audit - $STUDENT_NAME"
echo ""
echo "Distro  : $DISTRO"
echo "Kernel  : $KERNEL"
echo "User    : $USER_NAME"
echo "Home    : $HOME_DIR"
echo "Uptime  : $UPTIME"
echo "Date    : $CURRENT_DATE"
echo "License : GNU General Public License (GPL)"
echo ""
#!/bin/bash
# Script 2: FOSS Package Inspector

PACKAGE="git"

# Check if package is installed (Debian/Ubuntu)
if dpkg -l | grep -qw $PACKAGE; then
    echo "$PACKAGE is installed."
    dpkg -l | grep $PACKAGE | awk '{print "Version:", $3}'
else
    echo "$PACKAGE is NOT installed."
fi

#  Case statement 
case $PACKAGE in
    git)
        echo "Git: Distributed version control system for tracking code changes."
        ;;
    apache2)
        echo "Apache: Web server powering much of the internet."
        ;;
    mysql-server)
        echo "MySQL: Open-source relational database system."
        ;;
    vlc)
        echo "VLC: Free and open-source multimedia player."
        ;;
    *)
        echo "Unknown package."
        ;;
esac
#!/bin/bash
# Script 3: Disk and Permission Auditor

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" |awk '{print $1,$3,$4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR -> Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

echo ""

GIT_CONFIG="$HOME/.gitconfig"

if [ -f "$GIT_CONFIG" ]; then
    PERM=$(ls -l "$GIT_CONFIG" | awk '{print $1}')
    echo "Git Config File exists: $GIT_CONFIG"
    echo "Permissions: $PERM"
else
    echo "Git Config file not found."
fi
#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./log_analyzer.sh /var/log/syslog error

LOGFILE=$1
KEYWORD=${2:-error}   # Default keyword is 'error'
COUNT=0

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

if [ ! -s "$LOGFILE" ]; then
    echo "Warning: File is empty. Retrying in 2 seconds..."
    sleep 2
    if [ ! -s "$LOGFILE" ]; then
        echo "File is still empty. Exiting."
        exit 1
    fi
fi

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        ((COUNT++))
    fi
done < "$LOGFILE"

# Output result 
echo ""
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo ""

echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
#!/bin/bash
# Script 5: User Activity & Login Tracker

echo "="
echo " User Activity Report"
echo "=="


echo "Currently Logged-in Users:"
who

USER_COUNT=$(who | wc -l)
echo ""
echo "Total Active Users: $USER_COUNT"

# Last login details
echo ""
echo "Last Login Details:"
last -n 5


echo " current date and time"
echo "Report Generated On:"
date

LOGFILE="user_activity.log"
echo "" >> $LOGFILE
echo "Report generated on: $(date)" >> $LOGFILE
who >> $LOGFILE
echo "Total Users: $USER_COUNT" >> $LOGFILE

echo ""
echo "Report also saved to $LOGFILE"
echo "========================================="
