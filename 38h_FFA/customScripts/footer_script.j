//*************************************************************************** 
//* 
//*  Players 
//* 
//*************************************************************************** 

function InitCustomPlayerSlots takes nothing returns nothing 

    // Player 0 
    call SetPlayerStartLocation(Player(0), 0) 
    call SetPlayerColor(Player(0), ConvertPlayerColor(0)) 
    call SetPlayerRacePreference(Player(0), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(0), true) 
    call SetPlayerController(Player(0), MAP_CONTROL_USER) 

    // Player 1 
    call SetPlayerStartLocation(Player(1), 1) 
    call SetPlayerColor(Player(1), ConvertPlayerColor(1)) 
    call SetPlayerRacePreference(Player(1), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(1), true) 
    call SetPlayerController(Player(1), MAP_CONTROL_USER) 

    // Player 2 
    call SetPlayerStartLocation(Player(2), 2) 
    call SetPlayerColor(Player(2), ConvertPlayerColor(2)) 
    call SetPlayerRacePreference(Player(2), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(2), true) 
    call SetPlayerController(Player(2), MAP_CONTROL_USER) 

    // Player 3 
    call SetPlayerStartLocation(Player(3), 3) 
    call SetPlayerColor(Player(3), ConvertPlayerColor(3)) 
    call SetPlayerRacePreference(Player(3), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(3), true) 
    call SetPlayerController(Player(3), MAP_CONTROL_USER) 

    // Player 4 
    call SetPlayerStartLocation(Player(4), 4) 
    call SetPlayerColor(Player(4), ConvertPlayerColor(4)) 
    call SetPlayerRacePreference(Player(4), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(4), true) 
    call SetPlayerController(Player(4), MAP_CONTROL_USER) 

    // Player 5 
    call SetPlayerStartLocation(Player(5), 5) 
    call SetPlayerColor(Player(5), ConvertPlayerColor(5)) 
    call SetPlayerRacePreference(Player(5), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(5), true) 
    call SetPlayerController(Player(5), MAP_CONTROL_USER) 

    // Player 6 
    call SetPlayerStartLocation(Player(6), 6) 
    call SetPlayerColor(Player(6), ConvertPlayerColor(6)) 
    call SetPlayerRacePreference(Player(6), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(6), true) 
    call SetPlayerController(Player(6), MAP_CONTROL_USER) 

    // Player 7 
    call SetPlayerStartLocation(Player(7), 7) 
    call SetPlayerColor(Player(7), ConvertPlayerColor(7)) 
    call SetPlayerRacePreference(Player(7), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(7), true) 
    call SetPlayerController(Player(7), MAP_CONTROL_USER) 

    // Player 8 
    call SetPlayerStartLocation(Player(8), 8) 
    call SetPlayerColor(Player(8), ConvertPlayerColor(8)) 
    call SetPlayerRacePreference(Player(8), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(8), true) 
    call SetPlayerController(Player(8), MAP_CONTROL_USER) 

    // Player 9 
    call SetPlayerStartLocation(Player(9), 9) 
    call SetPlayerColor(Player(9), ConvertPlayerColor(9)) 
    call SetPlayerRacePreference(Player(9), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(9), true) 
    call SetPlayerController(Player(9), MAP_CONTROL_USER) 

    // Player 10 
    call SetPlayerStartLocation(Player(10), 10) 
    call SetPlayerColor(Player(10), ConvertPlayerColor(10)) 
    call SetPlayerRacePreference(Player(10), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(10), true) 
    call SetPlayerController(Player(10), MAP_CONTROL_USER) 

    // Player 11 
    call SetPlayerStartLocation(Player(11), 11) 
    call SetPlayerColor(Player(11), ConvertPlayerColor(11)) 
    call SetPlayerRacePreference(Player(11), RACE_PREF_RANDOM) 
    call SetPlayerRaceSelectable(Player(11), true) 
    call SetPlayerController(Player(11), MAP_CONTROL_USER) 

endfunction 

function InitCustomTeams takes nothing returns nothing 
    // Force: TRIGSTR_3212 
    call SetPlayerTeam(Player(0), 0) 
    call SetPlayerTeam(Player(1), 0) 
    call SetPlayerTeam(Player(2), 0) 
    call SetPlayerTeam(Player(3), 0) 
    call SetPlayerTeam(Player(4), 0) 
    call SetPlayerTeam(Player(5), 0) 
    call SetPlayerTeam(Player(6), 0) 
    call SetPlayerTeam(Player(7), 0) 
    call SetPlayerTeam(Player(8), 0) 
    call SetPlayerTeam(Player(9), 0) 
    call SetPlayerTeam(Player(10), 0) 
    call SetPlayerTeam(Player(11), 0) 

endfunction 

function InitAllyPriorities takes nothing returns nothing 

    call SetStartLocPrioCount(0, 11) 
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(0, 3, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(0, 4, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(0, 5, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(0, 6, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(0, 7, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(0, 8, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(0, 9, 10, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(0, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(1, 11) 
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(1, 3, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(1, 4, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(1, 5, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(1, 6, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(1, 7, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(1, 8, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(1, 9, 10, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(1, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(2, 11) 
    call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(2, 3, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(2, 4, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(2, 5, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(2, 6, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(2, 7, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(2, 8, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(2, 9, 10, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(2, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(3, 11) 
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(3, 3, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(3, 4, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(3, 5, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(3, 6, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(3, 7, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(3, 8, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(3, 9, 10, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(3, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(4, 11) 
    call SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(4, 3, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(4, 4, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(4, 5, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(4, 6, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(4, 7, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(4, 8, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(4, 9, 10, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(4, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(5, 11) 
    call SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(5, 1, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(5, 2, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(5, 3, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(5, 4, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(5, 5, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(5, 6, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(5, 7, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(5, 8, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(5, 9, 10, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(5, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(6, 11) 
    call SetStartLocPrio(6, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(6, 1, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(6, 2, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(6, 3, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(6, 4, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(6, 5, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(6, 6, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(6, 7, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(6, 8, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(6, 9, 10, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(6, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(7, 11) 
    call SetStartLocPrio(7, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(7, 1, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(7, 2, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(7, 3, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(7, 4, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(7, 5, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(7, 6, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(7, 7, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(7, 8, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(7, 9, 10, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(7, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(8, 11) 
    call SetStartLocPrio(8, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(8, 1, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(8, 2, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(8, 3, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(8, 4, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(8, 5, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(8, 6, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(8, 7, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(8, 8, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(8, 9, 10, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(8, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(9, 11) 
    call SetStartLocPrio(9, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(9, 1, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(9, 2, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(9, 3, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(9, 4, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(9, 5, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(9, 6, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(9, 7, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(9, 8, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(9, 9, 10, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(9, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(10, 11) 
    call SetStartLocPrio(10, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(10, 1, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(10, 2, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(10, 3, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(10, 4, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(10, 5, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(10, 6, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(10, 7, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(10, 8, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(10, 9, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(10, 10, 11, MAP_LOC_PRIO_HIGH) 

    call SetStartLocPrioCount(11, 11) 
    call SetStartLocPrio(11, 0, 0, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(11, 1, 1, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(11, 2, 2, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(11, 3, 3, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(11, 4, 4, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(11, 5, 5, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(11, 6, 6, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(11, 7, 7, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(11, 8, 8, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(11, 9, 9, MAP_LOC_PRIO_HIGH) 
    call SetStartLocPrio(11, 10, 10, MAP_LOC_PRIO_HIGH) 
endfunction 

//*************************************************************************** 
//* 
//*  Main Initialization 
//* 
//*************************************************************************** 

//=========================================================================== 
function main takes nothing returns nothing 
    local weathereffect we 
    call SetCameraBounds(-7424.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -7424.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM)) 
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl") 
    set we = AddWeatherEffect(Rect(-8192.0, -6144.0, 8192.0, 6144.0), 'RAlr') 
    call EnableWeatherEffect(we, true) 
    call NewSoundEnvironment("Default") 
    call SetAmbientDaySound("LordaeronSummerDay") 
    call SetAmbientNightSound("LordaeronSummerNight") 
    call SetMapMusic("Music", true, 0) 
    call InitSounds() 
    call CreateRegions() 
    call CreateAllUnits() 
    call InitBlizzard() 
    call InitGlobals() 
    call InitCustomTriggers() 

endfunction 

//*************************************************************************** 
//* 
//*  Map Configuration 
//* 
//*************************************************************************** 

function config takes nothing returns nothing 
    call SetMapName("TRIGSTR_004") 
    call SetMapDescription("TRIGSTR_006") 
    call SetPlayers(12) 
    call SetTeams(12) 
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER) 

    call DefineStartLocation(0, -256.0, -640.0) 
    call DefineStartLocation(1, -256.0, -640.0) 
    call DefineStartLocation(2, -256.0, -640.0) 
    call DefineStartLocation(3, -256.0, -640.0) 
    call DefineStartLocation(4, -256.0, -640.0) 
    call DefineStartLocation(5, -256.0, -640.0) 
    call DefineStartLocation(6, -256.0, -640.0) 
    call DefineStartLocation(7, -256.0, -640.0) 
    call DefineStartLocation(8, -256.0, -640.0) 
    call DefineStartLocation(9, -256.0, -640.0) 
    call DefineStartLocation(10, -256.0, -640.0) 
    call DefineStartLocation(11, -256.0, -640.0) 

    // Player setup 
    call InitCustomPlayerSlots() 
    call SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(1), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(2), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(3), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(4), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(5), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(6), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(7), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(8), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(9), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(10), MAP_CONTROL_USER) 
    call SetPlayerSlotAvailable(Player(11), MAP_CONTROL_USER) 
    call InitGenericPlayerSlots() 
    call InitAllyPriorities() 
endfunction 
