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
WaitBeforeGameLoad := 12000

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
GrpDreamWorks := 5
GrpGearBox := 6
GrpHasBro := 7
GrpMarvel := 8
GrpParamount := 9
GrpPeanuts := 10
GrpStarWars := 11
GrpUniversal := 12
GrpWilliams := 13
GrpNickelodeon := 14


;1st element (group) how many times to press down to select group
;2nd element how many times to press down to select row table is on
;3rd element how many times to press right to select table

;--------------- Zen Originals ------------------
TblSonOfZeus := [GrpZen,0,0]
TblAdventureLand := [GrpZen,0,1]
TblCurseOfTheMummy := [GrpZen,0,2]
TblPinballNoir := [GrpZen,0,3]
TblSkyPirates := [GrpZen,0,4]

TblGrimTales := [GrpZen,1,0]
TblWrathOfTheElderGods := [GrpZen,1,1]
TblWildWest := [GrpZen,1,2]
TblCastleStorm := [GrpZen,1,3]
TblBioLab := [GrpZen,1,4]

TblPasha := [GrpZen,2,0]
TblRome := [GrpZen,2,1]
TblSecretsOfTheDeep := [GrpZen,2,2]

;--------------- DreamWorks ------------------
TblDragonsPinball := [GrpDreamWorks,0,0]
TblTrollsPinball := [GrpDreamWorks,0,1]
TblKungFuPandaPinball := [GrpDreamWorks,0,2]

;--------------- Gearbox ------------------
TblHomeWorld := [GrpGearBox,0,0]
TblBrotherInArms := [GrpGearBox,0,1]
TblBorderlands := [GrpGearBox,0,2]

;--------------- Hasbro ------------------
TblMyLittlePony := [GrpHasBro,0,0]

;--------------- Marvel ------------------
TblMVDrStrange := [GrpMarvel,0,0]
TblMVCaptainAmerica := [GrpMarvel,0,1]
TblMVFantasticFour := [GrpMarvel,0,2]
TblMVGhostRider := [GrpMarvel,0,3]
TblMVThor := [GrpMarvel,0,4]

TblMVXMen := [GrpMarvel,1,0]
TblMVMoonKnight := [GrpMarvel,1,1]
TblMVIronMan := [GrpMarvel,1,2]
TblMVSpiderMan := [GrpMarvel,1,3]
TblMVBlade := [GrpMarvel,1,4]

TblMVWolverine := [GrpMarvel,2,0]

;--------------- Paramount ------------------
TblWorldWarZ := [GrpParamount,0,0]

;--------------- Peanuts ------------------
TblSnoopyPinball := [GrpPeanuts,0,0]

;--------------- Star Wars ------------------
TblSWSolo := [GrpStarWars,0,0]
TblSWCalrissianChronicles := [GrpStarWars,0,1]
TblSWBattleOfMimban := [GrpStarWars,0,2]
TblSWTheLastJedi := [GrpStarWars,0,3]
TblSWAhchToIsland := [GrpStarWars,0,4]

TblSWRogueOne := [GrpStarWars,1,0]
TblSWRebels := [GrpStarWars,1,1]
TblSWForceAwakens := [GrpStarWars,1,2]
TblSWMightOfTheFirstOrder := [GrpStarWars,1,3]
TblSWReturnOfTheJedi := [GrpStarWars,1,4]

TblSWDarthVader := [GrpStarWars,2,0]
TblSWStarfighterAssault := [GrpStarWars,2,1]
TblSWHanSolo := [GrpStarWars,2,2]
TblSWDroids := [GrpStarWars,2,3]
TblSWNewHope := [GrpStarWars,2,4]

TblSWMastersOfTheForce := [GrpStarWars,3,0]
TblSWEmpireStrikesBack := [GrpStarWars,3,1]
TblSWCloneWars := [GrpStarWars,3,2]
TblSWBobaFett := [GrpStarWars,3,3]
TblSWMandalorian := [GrpStarWars,3,4]

TblSWClassicCollectibles := [GrpStarWars,4,0]

;--------------- Paramount ------------------
TblBackToTheFuture := [GrpUniversal,0,0]
TblJaws := [GrpUniversal,0,1]
TblET := [GrpUniversal,0,2]
TblJurassicWorld := [GrpUniversal,0,3]
TblJurassicParkPinball := [GrpUniversal,0,4]

TblJurassicParkPinballMayhem := [GrpUniversal,1,0]

;--------------- Williams ------------------
TblTheatreOfMagic := [GrpWilliams,0,0]
TblChampionPub := [GrpWilliams,0,1]
TblSafeCracker := [GrpWilliams,0,2]
TblBlackRose := [GrpWilliams,0,3]
TblAttackFromMars := [GrpWilliams,0,4]

TblPartyZone := [GrpWilliams,1,0]
TblTheGetAway := [GrpWilliams,1,1]
TblJunkYard := [GrpWilliams,1,2]
TblMedievalMadness := [GrpWilliams,1,3]
TblFunHouse := [GrpWilliams,1,4]

TblSpaceStation := [GrpWilliams,2,0]
TblDrDude := [GrpWilliams,2,1]
TblCirqusVoltaire := [GrpWilliams,2,2]
TblNoGoodGofers := [GrpWilliams,2,3]
TblArabianNights := [GrpWilliams,2,4]

TblWhiteWater := [GrpWilliams,3,0]
TblRoadShow := [GrpWilliams,3,1]
TblHurricane := [GrpWilliams,3,2]
TblSwordsOfFury := [GrpWilliams,3,3]
TblIndianaJones := [GrpWilliams,3,4]

TblTheMachineBrideOfPinBot := [GrpWilliams,4,0]
TblWorldCupSoccer := [GrpWilliams,4,1]
TblMonsterBash := [GrpWilliams,4,2]
TblCreatureOfTheBlackLagoon := [GrpWilliams,4,3]
TblTheAddamsFamily := [GrpWilliams,4,4]

;--------------- Nickelodeon ------------------
TblGarfieldPinball := [GrpNickelodeon,0,0]

;-------- Aliases as per zen's naming -----------
Table_2 := TblSWMastersOfTheForce
Table_6 := TblSWStarfighterAssault
Table_7 := TblMVThor
Table_10 := TblSWHanSolo
Table_12 := TblSWNewHope
Table_21 := TblMVGhostRider
Table_23 := TblPasha
Table_24 := TblSWReturnOfTheJedi
Table_27 := TblBioLab
Table_28 := TblSWDarthVader
Table_29 := TblAdventureLand
Table_30 := TblDrStrange
Table_31 := TblRome
Table_38 := TblFantasticFour
Table_40 := TblCastleStorm
Table_43 := TblSWEmpireStrikesBack
Table_45 := TblMVBlade
Table_46 := TblMVSpiderMan
Table_47 := TblSWCloneWars
Table_48 := TblMVCaptainAmerica
Table_49 := TblMVMoonKnight
Table_53 := TblSWBobaFett
Table_58 := TblSWDroids
Table_59 := TblXMen
Table_65 := TblMVIronMan
Table_66 := TblSecretsOfTheDeep
Table_71 := TblMVWolverine
Table_75 := TblWildWest
Table_77 := TblSWRebels
Table_80 := TblSonOfZeus
Table_88 := TblSWForceAwakens
Table_89 := TblSWMightOfTheFirstOrder
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
Table_154 := TblWorldWarZ
Table_155 := TblGrimTales
Table_156 := TblTheAddamsFamily
Table_157 := TblWorldCupSoccer

;--------Run Before (Need to be compiled)----End------
 
Run, "com.epicgames.launcher://apps/56a31432931740cdb0112d237d7d65aa?action=launch&silent=true"

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

	Sleep, 750

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


tblname := A_Args[1]
tblmode := A_Args[2]
tbl := Eval(tblname)[1]
if (tblmode = "")
	tblmode := "Classic"

if ((tblmode = "Pro") and !(tbl[1] = GrpWilliams))
	tblmode := "Classic"

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

