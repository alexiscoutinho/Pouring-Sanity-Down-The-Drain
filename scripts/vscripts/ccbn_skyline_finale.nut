//-----------------------------------------------------
local PANIC = 0
local TANK = 1
local DELAY = 2
//-----------------------------------------------------

DirectorOptions <-
{
	//-----------------------------------------------------

	 A_CustomFinale_StageCount = 8
	 
	 A_CustomFinale1 = PANIC
	 A_CustomFinaleValue1 = 3
	 
	 A_CustomFinale2 = DELAY
	 A_CustomFinaleValue2 = 10
	 
	 A_CustomFinale3 = TANK
	 A_CustomFinaleValue3 = 1
	 
	 A_CustomFinale4 = DELAY
	 A_CustomFinaleValue4 = 10
	 
	 A_CustomFinale5 = PANIC
	 A_CustomFinaleValue5 = 2
	 
	 A_CustomFinale6 = DELAY
	 A_CustomFinaleValue6 = 10
	 
	 A_CustomFinale7 = TANK
	 A_CustomFinaleValue7 = 2

	 A_CustomFinale8 = DELAY
	 A_CustomFinaleValue8 = 10
	 
SpecialRespawnInterval = 20
ZombieSpawnRange = 100
cm_MaxSpecials = 4

	//-----------------------------------------------------
}

TankOptions <- //Another separate table used when TANK in play
{
	ShouldAllowSpecialsWithTank = true
	SpecialRespawnInterval = 25
}

PanicOptions <- //General panic options
{
	CommonLimit = 50
}