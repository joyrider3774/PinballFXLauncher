# Pinball FX Launcher 
![DownloadCountTotal](https://img.shields.io/github/downloads/joyrider3774/PinballFXLauncher/total?label=total%20downloads&style=plastic) ![DownloadCountLatest](https://img.shields.io/github/downloads/joyrider3774/PinballFXLauncher/latest/total?style=plastic) ![LatestVersion](https://img.shields.io/github/v/tag/joyrider3774/PinballFXLauncher?label=Latest%20version&style=plastic) ![License](https://img.shields.io/github/license/joyrider3774/PinballFXLauncher?style=plastic)

A Launch Autohotkey script for pinball FX that adds per table launching support. Plus a collection of docklet wheel images that go with it

## Release / Help Video
[![Pinball FX Launcher V1.0 Helper Video](http://img.youtube.com/vi/_XECsVwUTlI/0.jpg)](https://youtu.be/_XECsVwUTlI "Pinball FX Launcher V1.0 Helper Video")

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
Daily Free Tables will also always start classic mode, as i have no way in determining the difference between a Williams and Non Williams Table.
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

## Credits:
- Docklet logo's are taken randomly from internet and what i had on my pinball cabinet for pinball FX3
- Docklet images themselves mostly come from the backglasses from this url https://www.dropbox.com/sh/l4so158sh8s2ewx/AACO7ZCV5LAOw2I_fORzspZ5a/Cabinet?dl=0&subfolder_nav_tracking=1 (you can also use these for your pinball FX setup)
- Docklet template comes from pinball x forums from the zaccaria docklet wheel topic
- script uses eval function made by Pulover [Rodolfo U. Batista] and by Uberi (ExprEval())
