# Pinball FX Launcher 
[![Download Latest Version](https://img.shields.io/github/v/tag/joyrider3774/PinballFXLauncher?label=Latest%20version&style=plastic)](https://github.com/joyrider3774/PinballFXLauncher/releases "Download Latest Version") ![License](https://img.shields.io/github/license/joyrider3774/PinballFXLauncher?style=plastic)

A Launch Autohotkey script for pinball FX that adds per table launching support. Plus a collection of docklet wheel images that go with it

## Release / Help Video

### Script install / usage instructions (see this first)
[![Pinball FX Launcher V1.0 Helper Video](http://img.youtube.com/vi/_XECsVwUTlI/0.jpg)](https://youtu.be/_XECsVwUTlI "Pinball FX Launcher V1.0 Helper Video")

### Pinup Popper install instructions
[![Pinball FX Launcher Pinup Popper Helper Video](http://img.youtube.com/vi/XlcSQ_hOWcA/0.jpg)](https://youtu.be/XlcSQ_hOWcA "Pinball FX Launcher Pinup Popper Helper Video")


## Media Preview:
- [Tarcisio Wheels](TarcisioWheelsPreview.md)
- [Docklet Wheels](DockletWheelsPreview.md)
- [Backglasses](BackglassesPreview.md)
- [Tables](TablesPreview.md)

## Usage
Compile To Exe (check video above) then use these commands

```
LaunchPinballFX.exe [TableName] [Mode]
```

Where `[TableName]` is the name of the table and `[Mode]` the game mode to play

## Game Modes
You can use any of the listed game mode values below for the `[Mode]` Parameter

- Classic
- Pro
- Arcade
- Hotseat2
- Hotseat3
- Hotseat4
- Practice
- Distance
- Time
- 1Ball
- Flips 

Pro mode is only available on Williams tables, if you select Pro Mode on another table it will use Classic Mode.
Daily Free Tables will also always start classic mode as when you don't own the tables only classic mode is availble.
If you don't Specify the game mode, it will always use classic mode

## Table Names
You can use any of the listed Table Name values below for the `[TableName]` Parameter

### Daily Free Tables
- TblDaily1
- TblDaily2

### Zen Original Tables
- TblAdventureLand
- TblBioLab
- TblCastleStorm
- TblCurseOfTheMummy
- TblGrimTales
- TblPasha
- TblPinballNoir
- TblRome
- TblSecretsOfTheDeep
- TblSkyPirates
- TblSonOfZeus
- TblWildWest
- TblWrathOfTheElderGods

### Williams Tables
- TblArabianNights
- TblAttackFromMars
- TblBlackRose
- TblChampionPub
- TblCirqusVoltaire
- TblCreatureOfTheBlackLagoon
- TblDrDude
- TblFunHouse
- TblHurricane
- TblIndianaJones
- TblJunkYard
- TblMedievalMadness
- TblMonsterBash
- TblNoGoodGofers
- TblPartyZone
- TblRoadShow
- TblSafeCracker
- TblSpaceStation
- TblSwordsOfFury
- TblTheGetAway
- TblTheMachineBrideOfPinBot
- TblTheatreOfMagic
- TblWhiteWater
- TblWorldCupSoccer

### Universal Tables
- TblBackToTheFuture
- TblET
- TblJaws
- TblJurassicParkPinball
- TblJurassicParkPinballMayhem
- TblJurassicWorld

### Star Wars Tables
- TblSWAhchToIsland
- TblSWBattleOfMimban
- TblSWBobaFett
- TblSWCalrissianChronicles
- TblSWClassicCollectibles
- TblSWCloneWars
- TblSWDarthVader
- TblSWDroids
- TblSWEmpireStrikesBack
- TblSWForceAwakens
- TblSWHanSolo
- TblSWMandalorian
- TblSWMastersOfTheForce
- TblSWMightOfTheFirstOrder
- TblSWNewHope
- TblSWRebels
- TblSWReturnOfTheJedi
- TblSWRogueOne
- TblSWSolo
- TblSWStarfighterAssault
- TblSWTheLastJedi

### Paramount Tables
- TblWorldWarZ

### Hasbro Tables
- TblMyLittlePony

### Gearbox Tables
- TblHomeWorld


## Cabinet setup pinball X

### Pinball X Settings 
compile the provided script to an EXE and make sure it's working then use these settings:
<IMG src="meta/pinballxsetings.png"/>

### Launch before & After script
You will need a launch before to run some program to rotate your screen to portrait mode. I personally use irotate

Launch before (bat):
```
powershell -Command "Start-Process 'irotate.exe' '/2:rotate=90 /exit' -Verb runAs -WorkingDirectory 'C:\Program Files (x86)\iRotate\'"
```

Launch After (bat):
```
powershell -Command "Start-Process 'irotate.exe' '/2:rotate=0 /exit' -Verb runAs -WorkingDirectory 'C:\Program Files (x86)\iRotate\'"
```

## Cabinet setup pinball X using my Launcher app
![pinball FX launcher app](https://github.com/joyrider3774/PinballX_Launcher_app/raw/master/other_games/Pinball%20FX/launcher.png)

You can also use my [pinball launcher app](https://github.com/joyrider3774/PinballX_Launcher_app/tree/master/other_games/Pinball%20FX) with a specific ini file for this launch script to select all the new game modes more easily if your frontend does not support selecting these by default. I think pinup popper does have these options, but pinball x/y does not.

## Cabinet setup Pinup Popper

### Popper Settings 
compile the provided script to an EXE and make sure it's working then add a new emulator using these settings and import the games from [exported game](https://raw.githubusercontent.com/joyrider3774/PinballFXLauncher/main/Databases/Popper/Export_Pinball%20FX.pupgames) list i made (Use right click save as)
Also download Display.exe from this [zip file](https://www.nailbuster.com/uploads/PopperFXMirror.zip) made by NailBuster so you can rotate the screen. Extract this in `PinUPPopper\Launch` directory

<IMG src="meta/poppersettings.png"/>

### Launch Script
```
@echo off

REM Change /device 1 to your device id for your playfield screen

START "" "[STARTDIR]Launch\display.exe" /device 1 /rotate 90

timeout 2

REM backglass Videos from popper seems to stop playing sometimes when activating cabinet mode in the game
REM so this is a workaround to using ffplay.exe from ffmpeg to replay the videos, ffplay seems unaffected
REM by this problem so replaying the videos through that will work 
REM Remove REM below and make sure you have ffplay.exe in the launch directory and have adapted position
REM settings for your backglass position
REM start /min "" "[STARTDIR]Launch\ffplay.exe" -left 1080 -top 0 -x 1920 -y 1080 -alwaysontop -noborder -loop 0 "[MEDIADIR]backglass\[GAMENAME].mp4"


REM if you prefer classic mode also for williams tables set PRO on Next line below to Classic

SET ALTPARAM=Pro
if "[ALTMODE]"=="Classic" (SET ALTPARAM=Classic )
if "[ALTMODE]"=="Pro" (SET ALTPARAM=Pro )
if "[ALTMODE]"=="Arcade" (SET ALTPARAM=Arcade )
if "[ALTMODE]"=="Hotseat2" (SET ALTPARAM=Hotseat2 )
if "[ALTMODE]"=="Hotseat3" (SET ALTPARAM=Hotseat3 )
if "[ALTMODE]"=="Hotseat4" (SET ALTPARAM=Hotseat4 )
if "[ALTMODE]"=="1Ball" (SET ALTPARAM=1Ball )
if "[ALTMODE]"=="Time" (SET ALTPARAM=Time )
if "[ALTMODE]"=="Distance" (SET ALTPARAM=Distance )
if "[ALTMODE]"=="Flips" (SET ALTPARAM=Flips )
if "[ALTMODE]"=="Practice" (SET ALTPARAM=Practice )

START "" "[DIREMU]\LaunchPinballFX.exe" [GAMENAME] %ALTPARAM%

timeout 5

START "" "[STARTDIR]Launch\VPXSTARTER.exe" 10 10 60 "PinballFX"

```

### Close Script
```
START "" "[STARTDIR]Launch\display.exe" /device 1 /rotate 0
timeout 2
"[STARTDIR]LAUNCH\PUPCLOSER.EXE" WINTIT "PinballFX" 5 1
timeout 1
taskkill /f /im epicgameslauncher.exe
taskkill /f /IM ffplay.exe
```

## Credits:
- stang-retro geradg: Adding tags and manufactors to pinup popper database as well as playtesting the script in pinup popper
- Docklet logo's are taken randomly from internet and what i had on my pinball cabinet for pinball FX3
- Docklet images themselves mostly come from the backglasses from [this dropbox link](https://www.dropbox.com/sh/l4so158sh8s2ewx/AACO7ZCV5LAOw2I_fORzspZ5a/Cabinet?dl=0&subfolder_nav_tracking=1)
- Docklet template comes from pinball x forums from the zaccaria docklet wheel topic
- Tarcisio wheel image used template from [NailBuster](https://www.nailbuster.com/pup/tar_wheel.png)
- script uses eval function made by Pulover [Rodolfo U. Batista] and by Uberi (ExprEval())
- Table Images i made myself using the screenshot function from [Pinball X](https://www.pinballx.com/)
- Backglass images were initially taken from [this dropbox link](https://www.dropbox.com/sh/l4so158sh8s2ewx/AACO7ZCV5LAOw2I_fORzspZ5a/Cabinet?dl=0&subfolder_nav_tracking=1)
- Certain backglasses are intially made by "TheTrainGoes" see his github [here](https://github.com/TheTrainGoes/Pinball-FX3-Backglass) 
- Certain backglasses are from promotional images from Zen Studios.
- I Edited certain backglasses, i tried to either remove PFX2/3 logos or replace it with a pinball FX Logo
- On certain other backglasses i added a "Table" logo as i prefer to see the table names in the backglasses.
