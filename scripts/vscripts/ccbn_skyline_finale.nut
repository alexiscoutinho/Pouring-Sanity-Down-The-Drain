const PANIC = 0
const TANK = 1
const DELAY = 2

DirectorOptions <-
{
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

	CommonLimit = 50//
	MaxSpecials = 4
	ShouldAllowSpecialsWithTank = true
	SpecialRespawnInterval = 18
	ZombieSpawnRange = 100//
}

function OnBeginCustomFinaleStage( num, type )
{
	if (num == 3)
		DirectorOptions.SpecialRespawnInterval = 22
	else if (num == 7)
		DirectorOptions.SpecialRespawnInterval = 32
	else
		DirectorOptions.SpecialRespawnInterval = 18
}

function DisconnectNavUnderHeli()
{
	local pairs = [[929, 1243], [930, 1245], [931, 142], [946, 142]]

	local area1, area2
	foreach (pair in pairs)
	{
		area1 = NavMesh.GetNavAreaByID( pair[0] )
		area2 = NavMesh.GetNavAreaByID( pair[1] )
		area1.Disconnect( area2 )
		area2.Disconnect( area1 )
	}

	foreach (id in [948, 950])
		NavMesh.GetNavAreaByID( id ).MarkAsBlocked( -1 )

	function OnGameEvent_round_end( params )
	{
		ReconnectNavUnderHeli( pairs )
	}
	__CollectEventCallbacks( this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener )//
}

function ReconnectNavUnderHeli( pairs )
{
	local area1, area2
	foreach (pair in pairs)
	{
		area1 = NavMesh.GetNavAreaByID( pair[0] )
		area2 = NavMesh.GetNavAreaByID( pair[1] )
		area1.ConnectTo( area2, -1 )
		area2.ConnectTo( area1, -1 )
	}
}