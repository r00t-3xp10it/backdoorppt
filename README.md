[![Version](https://img.shields.io/badge/backdoorppt-1.3-brightgreen.svg?maxAge=259200)]()
[![Stage](https://img.shields.io/badge/Release-developing-red.svg)]()
[![Build](https://img.shields.io/badge/Supported_OS-kali,Ubuntu,Mint-blue.svg)]()


# backdoorppt - 'A binary transformation tool'

    Version release: v1.3-Beta
    Distros Supported: Linux Kali, Ubuntu, Mint
    Author: pedro ubuntu  [ r00t-3xp10it ]
    Suspicious-Shell-Activity© (SSA) RedTeam develop @2017

<br />

## Transform your payload.exe into one fake word doc (.ppt)

    Simple script that allow users to add a ms-word icon to one
    existing executable.exe (using resource-hacker as backend appl)
    and a ruby one-liner command that will hidde the .exe extension
    and add the word doc .ppt extension to the end of the file name.

    "backdoor transformed final name: resumeexe.ppt"

## Dependencies (backend applications required)

    wine, ruby, resource hacker(wine)

    'backdoorppt script will work on wine 32 or 64 bites'
    'it also installs ResourceHacker under .wine directory'

## Tool restrictions

    1º - backdoorppt only supports windows binarys to be transformed (.exe -> .ppt)
    2º - backdoorppt requires ResourceHacker installed (wine) to change the icons
    3º - backdoorppt does not build real ms-word doc files, but it will transform
         your payload.exe into a fake word doc file (social engineering execution).

<br />

## Screenshots
![backdoorppt](https://dl.dropboxusercontent.com/u/21426454/github/backdoorppt.png)

<br />
Credits: **Damon Mohammadbagher**
<br />
Article: **goo.gl/hKHesk**

