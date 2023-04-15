; Created by joyrider 3774 05/11/2022  
;--------Run Before (Need to be compiled)----Start------

#SingleInstance force
#include Eval.ahk

SetTitleMatchMode, 1
DetectHiddenWindows, On
DetectHiddenText, On
SetWorkingDir %A_ScriptDir%

;------------- User inputs ----------------------

; before activating the window of pinball FX, if it's found. You can increase this if the windows takes longer to show but you might need to lower next value then
WaitBeforeActivate := 6000

; after finding window and waiting to see "press any key to continue"
WaitBeforeGameLoad := 18000

; after game "press any key to continue" screen and waiting before menu is visible
WaitBeforeMenu := 18000

;time between key down / up presses 
KeyDelay := 50

;set this to true to let the script enable cabinet mode in the game. You need to set it up before hand correctly
DoCabinetMode := false

;set this to true for testing out the script on your system to know if it's working correctly.
;you should hear 1 beep when the game window is detected then a "WaitBeforeGameLoad" time is slept, 
;then you should hear another beep, but this beep should be heared while the press any key to continue message is already displayed
;then "WaitBeforeMenu" ms is slept and you should hear a final beep, this beep should be heared with the menu fully loaded and sitting at
;the news page. If you don't let the game load the news page by default, change it to let it load the news page 1st again or it won't working
;then the script starts selecting the tables 
DoPlayBeeps := true

;i noticed my game could loose focuse so if you have problems with that please set doActivateWindow to true
;or if you have problems with the game not receiving input set doActivateWindow to true 
;also try out setting the flag to run this script as administrator in properties of your build exe or lower "WaitBeforeActivate" time
DoActivateWindow := true

;-------- constants ----------
GrpZen := 4
GrpBraceYourself := 5
GrpDreamWorks := 6
GrpGearBox := 7
GrpHasBro := 8
GrpLegendary := 9
GrpMarvel := 10
GrpParamount := 11
GrpPeanuts := 12
GrpStarWars := 13
GrpUniversal := 14
GrpWilliams := 15
GrpNickelodeon := 16


;1st element (group) how many times to press down to select group
;2nd element how many times to press down to select row table is on
;3rd element how many times to press right to select table

;--------------- Zen Originals ------------------
TblSorcerersLair = [GrpZen,0,0]
TblWildWest := [GrpZen,0,1]
TblCurseOfTheMummy := [GrpZen,0,2]
TblWrathOfTheElderGods := [GrpZen,0,3]
TblGrimTales := [GrpZen,0,4]

TblSkyPirates := [GrpZen,1,0]
TblPinballNoir := [GrpZen,1,1]
TblCastleStorm := [GrpZen,1,2]
TblAdventureLand := [GrpZen,1,3]
TblSonOfZeus := [GrpZen,1,4]

TblSecretsOfTheDeep := [GrpZen,2,0]
TblRome := [GrpZen,2,1]
TblPasha := [GrpZen,2,2]
TblBioLab := [GrpZen,2,3]

;--------------- BaceYourself ------------------
TblCryptOfTheNecroDancer = [GrpBraceYourself, 0,0]

;--------------- DreamWorks ------------------
TblDragonsPinball := [GrpDreamWorks,0,0]
TblTrollsPinball := [GrpDreamWorks,0,1]
TblKungFuPandaPinball := [GrpDreamWorks,0,2]

;--------------- Gearbox ------------------
TblBrotherInArms := [GrpGearBox,0,0]
TblHomeWorld := [GrpGearBox,0,1]
TblBorderlands := [GrpGearBox,0,2]

;--------------- Hasbro ------------------
TblMyLittlePony := [GrpHasBro,0,0]

;--------------- Legendary ------------------
TblGodzilla = [GrpLegendary,0,0]
TblKong = [GrpLegendary,0,1];
TblGodzillaVsKong = [GrpLegendary,0,2];

;--------------- Marvel ------------------
TblMVDeadPool := [GrpMarvel,0,0]
TblMVSpiderMan := [GrpMarvel,0,1]
TblMVBlade := [GrpMarvel,0,2]
TblMVFantasticFour := [GrpMarvel,0,3]
TblMVDrStrange := [GrpMarvel,0,4]

TblMVGhostRider := [GrpMarvel,1,0]
TblMVCaptainAmerica := [GrpMarvel,1,1]
TblMVAvengers := [GrpMarvel,1,2]
TblMVMoonKnight := [GrpMarvel,1,3]
TblMVFearItself := [GrpMarvel,1,4]

TblMVCivilWar := [GrpMarvel,2,0]
TblMVWomenOfPowerChampions := [GrpMarvel,2,1]
TblMVWolverine := [GrpMarvel,2,2]
TblMVWomenOfPowerAForce := [GrpMarvel,2,3]
TblMVAntman := [GrpMarvel,2,4]

TblMVAvengersAgeOfUltron := [GrpMarvel,3,0]
TblMVVenom := [GrpMarvel,3,1]
TblMVIronMan := [GrpMarvel,3,2]
TblMVGuardiansOfTheGalaxy := [GrpMarvel,3,3]
TblMVInfinityGauntlet := [GrpMarvel,3,4]

TblMVXMen := [GrpMarvel,4,0]
TblMVWorldWarHulk := [GrpMarvel,4,1]
TblMVThor := [GrpMarvel,4,2]

;--------------- Paramount ------------------
TblWorldWarZ := [GrpParamount,0,0]

;--------------- Peanuts ------------------
TblSnoopyPinball := [GrpPeanuts,0,0]

;--------------- Star Wars ------------------
TblSWStarfighterAssault := [GrpStarWars,0,0]
TblSWBobaFett := [GrpStarWars,0,1]
TblSWReturnOfTheJedi := [GrpStarWars,0,2]
TblSWDarthVader := [GrpStarWars,0,3]
TblSWHanSolo := [GrpStarWars,0,4]

TblSWCloneWars := [GrpStarWars,1,0]
TblSWNewHope := [GrpStarWars,1,1]
TblSWMastersOfTheForce := [GrpStarWars,1,2]
TblSWMandalorian := [GrpStarWars,1,3]
TblSWClassicCollectibles := [GrpStarWars,1,4]

TblSWDroids := [GrpStarWars,2,0]
TblSWSolo := [GrpStarWars,2,1]
TblSWRebels := [GrpStarWars,2,2]
TblSWBattleOfMimban := [GrpStarWars,2,3]
TblSWCalrissianChronicles := [GrpStarWars,2,4]

TblSWAhchToIsland := [GrpStarWars,3,0]
TblSWRogueOne := [GrpStarWars,3,1]
TblSWTheLastJedi := [GrpStarWars,3,2]
TblSWEmpireStrikesBack := [GrpStarWars,3,3]
TblSWMightOfTheFirstOrder := [GrpStarWars,3,4]

TblSWForceAwakens := [GrpStarWars,4,0]

;--------------- Paramount ------------------
TblBackToTheFuture := [GrpUniversal,0,0]
TblJaws := [GrpUniversal,0,1]
TblET := [GrpUniversal,0,2]
TblJurassicWorld := [GrpUniversal,0,3]
TblJurassicParkPinball := [GrpUniversal,0,4]

TblJurassicParkPinballMayhem := [GrpUniversal,1,0]

;--------------- Williams ------------------
TblFishTales := [GrpWilliams,0,0]
TblJunkYard := [GrpWilliams,0,1]
TblBlackRose := [GrpWilliams,0,2]
TblAttackFromMars := [GrpWilliams,0,3]
TblPartyZone := [GrpWilliams,0,4]

TblTheGetAway := [GrpWilliams,1,0]
TblMedievalMadness := [GrpWilliams,1,1]
TblSafeCracker := [GrpWilliams,1,2]
TblTheMachineBrideOfPinBot := [GrpWilliams,1,3]
TblWorldCupSoccer := [GrpWilliams,1,4]

TblMonsterBash := [GrpWilliams,2,0]
TblCreatureOfTheBlackLagoon := [GrpWilliams,2,1]
TblTheAddamsFamily := [GrpWilliams,2,2]
TblChampionPub := [GrpWilliams,2,3]
TblDrDude := [GrpWilliams,2,4]

TblWhiteWater := [GrpWilliams,3,0]
TblSwordsOfFury := [GrpWilliams,3,1]
TblRoadShow := [GrpWilliams,3,2]
TblHurricane := [GrpWilliams,3,3]
TblFunHouse := [GrpWilliams,3,4]

TblCirqusVoltaire := [GrpWilliams,4,0]
TblTheatreOfMagic := [GrpWilliams,4,1]
TblSpaceStation := [GrpWilliams,4,2]
TblNoGoodGofers := [GrpWilliams,4,3]
TblArabianNights := [GrpWilliams,4,4]

TblTwilightZone := [GrpWilliams,5,0]
TblIndianaJones := [GrpWilliams,5,1]

;--------------- Nickelodeon ------------------
TblGarfieldPinball := [GrpNickelodeon,0,0]

;-------- Aliases as per zen's naming -----------
Table_1 := TblMVCivilWar
Table_2 := TblSWMastersOfTheForce
Table_5 := TblMVFearItself
Table_6 := TblSWStarfighterAssault
Table_7 := TblMVThor
Table_10 := TblSWHanSolo
Table_12 := TblSWNewHope
Table_17 := TblMVAvengers
Table_21 := TblMVGhostRider
Table_22 := TblMVDeadPool
Table_23 := TblPasha
Table_24 := TblSWReturnOfTheJedi
Table_27 := TblBioLab
Table_28 := TblSWDarthVader
Table_29 := TblAdventureLand
Table_30 := TblDrStrange
Table_31 := TblRome
Table_33 := TblSorcerersLair
Table_38 := TblFantasticFour
Table_40 := TblCastleStorm
Table_43 := TblSWEmpireStrikesBack
Table_45 := TblMVBlade
Table_46 := TblMVSpiderMan
Table_47 := TblSWCloneWars
Table_48 := TblMVCaptainAmerica
Table_49 := TblMVMoonKnight
Table_50 := TblMVGuardiansOfTheGalaxy
Table_53 := TblSWBobaFett
Table_56 := TblMVWorldWarHulk
Table_58 := TblSWDroids
Table_59 := TblXMen
Table_60 := TblMVInfinityGauntlet
Table_65 := TblMVIronMan
Table_66 := TblSecretsOfTheDeep
Table_71 := TblMVWolverine
Table_73 := TblMVVenom
Table_75 := TblWildWest
Table_77 := TblSWRebels
Table_78 := TblMVAvengersAgeOfUltron
Table_79 := TblMVAntman
Table_80 := TblSonOfZeus
Table_88 := TblSWForceAwakens
Table_89 := TblSWMightOfTheFirstOrder
Table_93 := TblMVWomenOfPowerAForce
Table_94 := TblMVWomenOfPowerChampions
Table_95 := TblJaws
Table_96 := TblET
Table_97 := TblBackToTheFuture
Table_98 := TblSWRogueOne
Table_100 := TblJurassicParkPinball
Table_101 := TblJurassicWorld
Table_102 := TblJurassicParkPinballMayhem
Table_103 := TblSWTheLastJedi
Table_104 := TblSWAhchToIsland
Table_105 := TblSWSolo
Table_106 := TblSWCalrissianChronicles
Table_107 := TblSWBattleOfMimban
Table_108 := TblFishTales
Table_109 := TblMedievalMadness
Table_110 := TblJunkYard
Table_111 := TblTheGetAway
Table_112 := TblCurseOfTheMummy
Table_113 := TblSkyPirates
Table_117 := TblTheatreOfMagic
Table_118 := TblBlackRose
Table_119 := TblAttackFromMars
Table_120 := TblPartyZone
Table_121 := TblChampionPub
Table_122 := TblSafeCracker
Table_123 := TblPinballNoir
Table_124 := TblWhiteWater
Table_125 := TblRoadShow
Table_126 := TblHurricane
Table_127 := TblCirqusVoltaire
Table_128 := TblNoGoodGofers
Table_129 := TblSpaceStation
Table_130 := TblMonsterBash
Table_131 := TblCreatureOfTheBlackLagoon
Table_132 := TblArabianNights
Table_133 := TblIndianaJones
Table_134 := TblFunHouse
Table_135 := TblDrDude
Table_136 := TblSWMandalorian
Table_137 := TblSWClassicCollectibles
Table_138 := TblMyLittlePony
Table_139 := TblKungFuPandaPinball
Table_140 := TblTrollsPinball
Table_141 := TblDragonsPinball
Table_145 := TblGarfieldPinball
Table_146 := TblSnoopyPinball
Table_147 := TblWrathOfTheElderGods
Table_148 := TblTheMachineBrideOfPinBot
Table_149 := TblSwordsOfFury
Table_150 := TblHomeWorld
Table_151 := TblBrotherInArms
Table_152 := TblBorderlands
Table_153 := TblKong
Table_154 := TblWorldWarZ
Table_155 := TblGrimTales
Table_156 := TblTheAddamsFamily
Table_157 := TblWorldCupSoccer
Table_158 := TblGodzilla
Table_160 := TblGodzillaVsKong
Table_161 := TblCryptOfTheNecroDancer
Table_162 := TblTwilightZone

;--------Run Before (Need to be compiled)----End------

tblname := ""
tblmode := ""
IsSteam := false
Steam := A_Args[1]

if (Steam = "Steam")
{
	IsSteam := true
}

if(IsSteam)
{
	tblname := A_Args[2]
	tblmode := A_Args[3]
}
else
{
	tblname := A_Args[1]
	tblmode := A_Args[2]
}

tbl := Eval(tblname)[1]
if (tblmode = "")
	tblmode := "Classic"

if ((tblmode = "Pro") and !(tbl[1] = GrpWilliams))
	tblmode := "Classic"

if(IsSteam)
{
	RegRead, SteamDirPath, HKCU, Software\Valve\Steam, SteamPath
	Run, "%SteamDirPath%\Steam.exe" -applaunch 2328760 
}
else
{
	Run, "com.epicgames.launcher://apps/56a31432931740cdb0112d237d7d65aa?action=launch&silent=true"
}

WinWait, PinballFX ahk_class UnrealWindow,, 120000
if (ErrorLevel) 
{
	MsgBox, WinWait timed out.
	exitapp
}

Sleep, WaitBeforeActivate

if (DoActivateWindow) 
{
	WinActivate, PinballFX ahk_class UnrealWindow
	Sleep, 50
}

if (DoPlayBeeps) 
{
	SoundBeep, 500, 500
}

EnableCabinetMode() {

	ControlSend ,, {ESC}, PinballFX ahk_class UnrealWindow

	Sleep, 1000

	Send {Down down}
	Sleep, %KeyDelay%
	Send {Down up}
	Sleep, %KeyDelay%

	Sleep, 250

	Send {Enter down}
	Sleep, %KeyDelay%
	Send {Enter up}
	Sleep, %KeyDelay%

	Sleep, 500

	Send {Enter down}
	Sleep, %KeyDelay%
	Send {Enter up}
	Sleep, %KeyDelay%

	Sleep, 500

	Send {Up down}
	Sleep, %KeyDelay%
	Send {Up up}
	Sleep, %KeyDelay%

	Sleep, 500

	Send {Enter down}
	Sleep, %KeyDelay%
	Send {Enter up}
	Sleep, %KeyDelay%


	Sleep, 500

	ControlSend ,, {ESC}, PinballFX ahk_class UnrealWindow

	Sleep, 250

	ControlSend ,, {ESC}, PinballFX ahk_class UnrealWindow

}

GotoMenu() {
	global KeyDelay
	global WaitBeforeGameLoad
	global WaitBeforeMenu
	global DoPlayBeeps
	global DoActivateWindow

	Sleep, %WaitBeforeGameLoad%

	if (DoPlayBeeps) 
	{
		SoundBeep, 500, 500
	}

	if (DoActivateWindow) 
	{
		WinActivate, PinballFX ahk_class UnrealWindow
		Sleep, 50
	}

	Send {Enter down}
	Sleep, %KeyDelay%
	Send {Enter up}
	Sleep, %KeyDelay%

	Sleep, %WaitBeforeMenu%

	if (DoPlayBeeps) 
	{
		SoundBeep, 500, 500
	}
	
	Return
}

SelectGameMode(Tbl, GameMode) {
	global GrpWilliams
	global KeyDelay

	NumDownAdd := 0
	NumDown := 0
	NumRight := 0

	if (GameMode = "Pro") {
		NumDown := 0
	}
	if (GameMode = "Arcade") {
		NumDown := 1
	}
	if ((GameMode = "Hotseat2") or (GameMode = "Hotseat3") or (GameMode = "Hotseat4")) {
		NumDown := 2
	}
	if (GameMode = "Practice") {
		NumDown := 3
	}

	if (GameMode = "Flips") {
		NumDown := 0
		NumRight := 1	
	}

	if (GameMode = "1Ball") {
		NumDown := 1
		NumRight := 1
	}
	
	if (GameMode = "Time") {
		NumDown := 2
		NumRight := 1
	}

	if (GameMode = "Distance") {
		NumDown := 3
		NumRight := 1
	}

	;with williams table it shifts with one extra down after "Classic" mode because of the added "Pro" Mode
	if ((Tbl[1] = GrpWilliams) and !(GameMode = "Classic") and (NumRight = 0)) {
		NumDown := NumDown + 1
	}

	;Select The Mode by pressing Right first
	Loop, %NumRight%
	{
		Send {Right down}
		Sleep, %KeyDelay%
		Send {Right up}
		Sleep, %KeyDelay%
		Sleep, 100
	}

	;Select The Mode by pressing down
	Loop, %NumDown%
	{
		Send {Down down}
		Sleep, %KeyDelay%
		Send {Down up}
		Sleep, %KeyDelay%
		Sleep, 100
	}

	;in case of hotseat 3 player or 4 player still need to select that
	if ((GameMode = "Hotseat3") or (GameMode = "Hotseat4")) {

		Send {Space down}
		Sleep, %KeyDelay%
		Send {Space up}
		Sleep, %KeyDelay%

		Sleep, 100

		if (GameMode = "Hotseat3") {
			NumRight := 1
		}

		if (GameMode = "Hotseat4") {
			NumRight := 2
		}

		Loop, %NumRight%
		{
			Send {Right down}
			Sleep, %KeyDelay%
			Send {Right up}
			Sleep, %KeyDelay%
			Sleep, 100
		}

		Sleep, 100
	}
}

;Send Enter + assumes correct position
StartGame() {
	global KeyDelay	

	Send {Enter down}
	Sleep, %KeyDelay%
	Send {Enter up}
	Sleep, %KeyDelay%
	Return
}

;need to be on NEWS !!!
SelectTable(Table) {
	global KeyDelay
	global DoActivateWindow

	if (DoActivateWindow) 
	{
		WinActivate, PinballFX ahk_class UnrealWindow
		Sleep, 50
	}

	
	Send {RShift down}
	Sleep, %KeyDelay%
	Send {RShift up}
	Sleep, %KeyDelay%

	Sleep, 1250

	LoopGroupCount := (Table[1])

	Loop, %LoopGroupCount%
	{
		Send {Down down}
		Sleep, %KeyDelay%
		Send {Down up}
		Sleep, %KeyDelay%
		Sleep, 250
	}

	;need to send one return to select the group
	Send {Return down}
	Sleep, %KeyDelay%
	Send {Return up}
	Sleep, %KeyDelay%

	Sleep, 250

	;need to send one right to be on table selection
	Send {Right down}
	Sleep, %KeyDelay%
	Send {Right up}
	Sleep, %KeyDelay%

	Sleep, 100

	LoopRowCount := (Table[2])

	Loop, %LoopRowCount%
	{
		Send {Down down}
		Sleep, %KeyDelay%
		Send {Down up}
		Sleep, %KeyDelay%
		Sleep, 50
	}

	LoopColCount := (Table[3])

	Loop, %LoopColCount%
	{
		Send {Right down}
		Sleep, %KeyDelay%
		Send {Right up}
		Sleep, %KeyDelay%
		Sleep, 50
	}

	Sleep, 250

	Send {Enter down}
	Sleep, %KeyDelay%
	Send {Enter up}
	Sleep, %KeyDelay%

	Sleep, 750

	Return
}


GotoMenu()

if (DoCabinetMode) 
{
	EnableCabinetMode()
}

SelectTable(tbl)
SelectGameMode(tbl, tblmode)
StartGame()

Process, WaitClose, PinballFX-Win64-Shipping.exe

ExitApp

;--------Run After (Need to be compiled)----End------

#IfWinActive PinballFX ahk_class UnrealWindow

; Exit Table
;	~Esc::
;		Gosub killApp
;		Sleep, 750
;		Send {Esc}
;	Return

#IfWinActive


killApp:
	Send !{f4}
	Process, Close, PinballFX-Win64-Shipping.exe
	If ErrorLevel
		Process, Close, %ErrorLevel%
	WinKill, Error	
	WinKill, PinballFX ahk_class UnrealWindow
	Run, taskkill /F /IM PinballFX-Win64-Shipping.exe /T,, Hide
Return

