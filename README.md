[![Version](https://img.shields.io/badge/backdoorppt-1.5-brightgreen.svg?maxAge=259200)]()
[![Stage](https://img.shields.io/badge/Release-STABLE-brightgreen.svg)]()
[![Build](https://img.shields.io/badge/Supported_OS-kali,Ubuntu,Mint-blue.svg)]()


# backdoorppt - 'Office spoof extensions tool'

    Version release: v1.5-Stable
    Distros Supported: Linux Kali, Ubuntu, Mint
    Author: pedro ubuntu  [ r00t-3xp10it ]
    Suspicious-Shell-Activity© (SSA) RedTeam develop @2017

<br />

## Transform your payload.exe into one fake word doc (.ppt)

    Simple script that allow users to add a ms-word icon to one
    existing executable.exe (using resource-hacker as backend appl)
    and a ruby one-liner command that will hidde the .exe extension
    and add the word doc .ppt extension to the end of the file name.


## Spoof extension methods

    backdoorppt tool uses 2 diferent extension spoof methods:
    'Right to Left Override' & 'Hide Extensions for Known File Types'
    Edit the 'settings' file to chose what method should be used..

    cd backdoorppt && nano settings
![backdoorppt](https://dl.dropboxusercontent.com/u/21426454/github/backdoorppt-settings.png)

    ResourceHacker.exe its giving bugs working under wine64 archs, to bypass the use
    of ResourceHacker software change the follow option to YES before runing backdoorppt
![backdoorppt](https://dl.dropboxusercontent.com/u/21426454/backdd.png)


## Dependencies (backend applications required)

    xterm, wine, ruby, ResourceHacker(wine)

    'backdoorppt script will work on wine 32 or 64 bits'
    'it also installs ResourceHacker under .../.wine/Program Files/.. directorys'

## Tool Limitations

    1º - backdoorppt only supports windows binarys to be transformed (.exe -> .ppt)
    2º - backdoorppt requires ResourceHacker installed (wine) to change the icons
    3º - backdoorppt present you 6 available diferent icons (.ico) to chose from
    4º - backdoorppt does not build real ms-word doc files, but it will transform
         your payload.exe to look like one word doc file (social engineering).

<br />

## Backdoorppt 1º run (Kali distros)
![backdoorppt](https://dl.dropboxusercontent.com/u/21426454/github/backdoorppt-requires.png)

## Backdoorppt working (Kali distros)
![backdoorppt](https://dl.dropboxusercontent.com/u/21426454/github/backdoorppt.png)

## transformed files on-target system (windows)
![backdoorppt](https://dl.dropboxusercontent.com/u/21426454/github/backdoorppt-windows.jpg)

## Final notes

    Target user thinks they are opening a word document file,
    but in fact they are executing one binary payload insted.

<br />
Credits: **Damon Mohammadbagher**
<br />
Article: **goo.gl/hKHesk**

