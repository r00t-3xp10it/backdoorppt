#!/bin/sh

# -----------------------------------
# Colorise shell Script output leters
# -----------------------------------
Colors() {
Escape="\033";
  white="${Escape}[0m";
  RedF="${Escape}[31m";
  GreenF="${Escape}[32m";
  YellowF="${Escape}[33m";
  BlueF="${Escape}[34m";
  CyanF="${Escape}[36m";
Reset="${Escape}[0m";
}


#
# progress bar funtion
#
Colors;
sleep 2.5 & PID=$! #simulate a long process

echo "${BlueF}[☆]${white} Please wait, searching for dependencies.${BlueF}"
printf "["
# While process is running...
while kill -0 $PID 2> /dev/null; do 
    printf  "#"
    sleep 0.1
done
printf "] done!"
echo ""
sleep 2 && clear


apc=`which ettercap`
if [ "$?" != "0" ]; then
echo ""
echo ${RedF}[☠]${white} ettercap '->' not found! ${Reset};
sleep 1
echo ${RedF}[☠]${white} This script requires ettercap to work! ${Reset};
echo ${RedF}[☠]${white} Please run: sudo apt-get install ettercap ${Reset};
echo ${RedF}[☠]${white} to install missing dependencies... ${Reset};
exit
else
echo ${BlueF}[☆]${white} Ettercap installation, found... ${Reset};
echo ""
fi
