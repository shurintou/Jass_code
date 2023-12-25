//=========================================================================== 
//  
// FightofAIs 
//  
//   Warcraft III map script 
//   Generated by the Warcraft III World Editor 
//   Date: Tue Oct 17 03:34:37 2023 
//   Map Author: Blizzard Entertainment 
//  
//=========================================================================== 

//*************************************************************************** 
//* 
//*  Global Variables 
//* 
//*************************************************************************** 

globals 
    // User-defined 
    unit udg_U = null 
    group udg_Group = null 
    force udg_Player = null 
    hashtable udg_hash = null 
    integer udg_i = 0 
    integer udg_n = 0 
    integer array udg_Heronumber 
    unit array udg_ComHero 
    unit array udg_SpellTarget 
    unit array udg_ExtraHero 
    real udg_Cameraheigh = 0 
    integer array udg_Item 
    group udg_HeroGroup = null 
    unit udg_UG = null 
    player udg_P = null 
    player udg_PG = null 
    real udg_X = 0 
    real udg_Y = 0 
    integer array udg_Chaoxi 
    unit array udg_Silinglong 
    real udg_Re = 0 
    unit udg_CameraUnit = null 
    real array udg_PX 
    real array udg_PY 
    group array udg_DianGroup 
    unit udg_DeathKnight = null 
    integer udg_testmode = 0 
    unit udg_testhero = null 
    integer udg_testheroplayer = 0 
    integer udg_lockcamara = 0 
    player udg_testplayer = null 
    terraindeformation array udg_T 
    group udg_NullGroup = null 
    real array udg_UGharm 
    unit udg_Gold = null 
    group udg_BlueTeamHero = null 
    group udg_RedTeamHero = null 
    playercolor array udg_Color 
    integer array udg_TimerBoolean 
    unit array udg_HelperHero 
    unit array udg_HelpeeHero 
    integer array udg_SpellTimer 
    integer array udg_DeathTimer 
    integer array udg_PreItem 
    integer array udg_RacePlayerNum 
    integer array udg_HeroRandomNum 
    unit array udg_LiveComHero 
    integer udg_ItemRandomNum = 0 
    integer udg_Observer = 0 
    integer udg_ActionIndex = 0 
    real udg_ActionScale = 0 
    unit udg_ObserverUnit = null 

    // Generated 
    sound gg_snd_SacrificeUnit = null 
    sound gg_snd_PandarenUltimate = null 
    trigger gg_trg_Start = null 
    trigger gg_trg_HeroAddItem = null 
    trigger gg_trg_herolevelup = null 
    trigger gg_trg_learnskill = null 
    trigger gg_trg_ModelUnitDead = null 
    trigger gg_trg_auotcamera = null 
    trigger gg_trg_code = null 
    trigger gg_trg_GetCode = null 
    trigger gg_trg_deathcamera = null 
    trigger gg_trg_camera = null 
    trigger gg_trg_darksummon = null 
    trigger gg_trg_up = null 
    trigger gg_trg_down = null 
    trigger gg_trg_left = null 
    trigger gg_trg_right = null 
    trigger gg_trg_esc = null 
    trigger gg_trg_setNumber = null 
    trigger gg_trg_humoriginhero = null 
    trigger gg_trg_zhujidi = null 
    trigger gg_trg_jianzhushengji = null 
    trigger gg_trg_tanke = null 
    trigger gg_trg_mages = null 
    trigger gg_trg_humbuilding = null 
    trigger gg_trg_Bloodmageattacked = null 
    trigger gg_trg_ATTackHum = null 
    trigger gg_trg_readybilizard = null 
    trigger gg_trg_billizardorder = null 
    trigger gg_trg_fengxingkaida = null 
    trigger gg_trg_fengxingkaiw = null 
    trigger gg_trg_windwalkshanbi = null 
    trigger gg_trg_fangdaodan = null 
    trigger gg_trg_daodans = null 
    trigger gg_trg_FireLoadVocalno = null 
    trigger gg_trg_FLvocalno = null 
    trigger gg_trg_Arthasgetharm = null 
    trigger gg_trg_Arthashealingnova = null 
    trigger gg_trg_Arthasdazhao = null 
    trigger gg_trg_bingfengqiu = null 
    trigger gg_trg_novaasdasd = null 
    trigger gg_trg_medivengongji = null 
    trigger gg_trg_medivenshifa = null 
    trigger gg_trg_dragonAttack = null 
    trigger gg_trg_dragonSpell = null 
    trigger gg_trg_RiftS = null 
    trigger gg_trg_RiftA = null 
    trigger gg_trg_RiftL = null 
    trigger gg_trg_GhostShip = null 
    trigger gg_trg_attackbycaptain = null 
    trigger gg_trg_SQS = null 
    trigger gg_trg_SOA = null 
    trigger gg_trg_GFS = null 
    trigger gg_trg_GFA = null 
    trigger gg_trg_FTS = null 
    trigger gg_trg_FTD = null 
    trigger gg_trg_FTA = null 
    trigger gg_trg_JKH = null 
    trigger gg_trg_JKA = null 
    trigger gg_trg_JKS = null 
    trigger gg_trg_LAA = null 
    trigger gg_trg_LAS = null 
    trigger gg_trg_LAH = null 
    trigger gg_trg_TTA = null 
    trigger gg_trg_TTS = null 
    trigger gg_trg_TTH = null 
    trigger gg_trg_orcoriginhero = null 
    trigger gg_trg_lietou = null 
    trigger gg_trg_linghun = null 
    trigger gg_trg_langqi = null 
    trigger gg_trg_orcbuilding = null 
    trigger gg_trg_TC = null 
    trigger gg_trg_farseeR = null 
    trigger gg_trg_bianyang = null 
    trigger gg_trg_Akamaillusion = null 
    trigger gg_trg_GromTaunt = null 
    trigger gg_trg_Gromattacked = null 
    trigger gg_trg_Gromchaofeng = null 
    trigger gg_trg_shouwangfangda = null 
    trigger gg_trg_shouwang = null 
    trigger gg_trg_shouwangH = null 
    trigger gg_trg_pandafangda = null 
    trigger gg_trg_panda = null 
    trigger gg_trg_guerdant = null 
    trigger gg_trg_healingunit = null 
    trigger gg_trg_shenlingAren = null 
    trigger gg_trg_huixueV = null 
    trigger gg_trg_shenlinggetharm = null 
    trigger gg_trg_ChaosA = null 
    trigger gg_trg_ChaosH = null 
    trigger gg_trg_ChaosS = null 
    trigger gg_trg_JDA = null 
    trigger gg_trg_JDS = null 
    trigger gg_trg_JDD = null 
    trigger gg_trg_MengmaA = null 
    trigger gg_trg_MengmaS = null 
    trigger gg_trg_MengmaH = null 
    trigger gg_trg_AMS = null 
    trigger gg_trg_AMA = null 
    trigger gg_trg_AMY = null 
    trigger gg_trg_ZDS = null 
    trigger gg_trg_ZDA = null 
    trigger gg_trg_WLS = null 
    trigger gg_trg_WLH = null 
    trigger gg_trg_WLA = null 
    trigger gg_trg_JumoA = null 
    trigger gg_trg_JumoS = null 
    trigger gg_trg_TCS = null 
    trigger gg_trg_TCA = null 
    trigger gg_trg_TCH = null 
    trigger gg_trg_IBH = null 
    trigger gg_trg_IBS = null 
    trigger gg_trg_IBA = null 
    trigger gg_trg_MonkeyA = null 
    trigger gg_trg_MonkeyS = null 
    trigger gg_trg_MonkeyH = null 
    trigger gg_trg_illusionControler = null 
    trigger gg_trg_udoriginhero = null 
    trigger gg_trg_destroyer = null 
    trigger gg_trg_udbuilding = null 
    trigger gg_trg_NightKingE = null 
    trigger gg_trg_deathknightC = null 
    trigger gg_trg_lichnova = null 
    trigger gg_trg_magicshield = null 
    trigger gg_trg_souldragon = null 
    trigger gg_trg_souldragona = null 
    trigger gg_trg_lichdetah = null 
    trigger gg_trg_pitlord = null 
    trigger gg_trg_Archmagebillizard = null 
    trigger gg_trg_pitloadfirerain = null 
    trigger gg_trg_xiaoheilevelup = null 
    trigger gg_trg_meihuodanwei = null 
    trigger gg_trg_XiaoheiS = null 
    trigger gg_trg_chixushifa = null 
    trigger gg_trg_deathfinger = null 
    trigger gg_trg_UG1 = null 
    trigger gg_trg_UG2 = null 
    trigger gg_trg_UGDA = null 
    trigger gg_trg_summondeadbody = null 
    trigger gg_trg_deadkingharm = null 
    trigger gg_trg_kuloubingjian = null 
    trigger gg_trg_gugongyinshenhero = null 
    trigger gg_trg_DianS = null 
    trigger gg_trg_DianA = null 
    trigger gg_trg_DianD = null 
    trigger gg_trg_FireQueenA = null 
    trigger gg_trg_FireQueen = null 
    trigger gg_trg_CKS = null 
    trigger gg_trg_CKA = null 
    trigger gg_trg_CKH = null 
    trigger gg_trg_XNS = null 
    trigger gg_trg_XNA = null 
    trigger gg_trg_DZS = null 
    trigger gg_trg_DZD = null 
    trigger gg_trg_DZA = null 
    trigger gg_trg_SJS = null 
    trigger gg_trg_SJA = null 
    trigger gg_trg_SJH = null 
    trigger gg_trg_DAS = null 
    trigger gg_trg_DAA = null 
    trigger gg_trg_SPS = null 
    trigger gg_trg_SPA = null 
    trigger gg_trg_DOS = null 
    trigger gg_trg_DOH = null 
    trigger gg_trg_DOA = null 
    trigger gg_trg_neoriginhero = null 
    trigger gg_trg_ac = null 
    trigger gg_trg_bianxiong = null 
    trigger gg_trg_jiaoying = null 
    trigger gg_trg_nebuilding = null 
    trigger gg_trg_fishmanshield = null 
    trigger gg_trg_fishmanstomp = null 
    trigger gg_trg_nelaolujifeng = null 
    trigger gg_trg_nelaolu = null 
    trigger gg_trg_lianjingetharm = null 
    trigger gg_trg_lianjin = null 
    trigger gg_trg_lianjinyiliaobo = null 
    trigger gg_trg_nageshield = null 
    trigger gg_trg_naga = null 
    trigger gg_trg_VNW1 = null 
    trigger gg_trg_VNW2 = null 
    trigger gg_trg_VNQ = null 
    trigger gg_trg_XINGattack = null 
    trigger gg_trg_XINGharmed = null 
    trigger gg_trg_XINGSpell = null 
    trigger gg_trg_Chaoxiattacked = null 
    trigger gg_trg_Chaoxiattack = null 
    trigger gg_trg_ChaoxiSpell = null 
    trigger gg_trg_TreeA = null 
    trigger gg_trg_TreeS = null 
    trigger gg_trg_TimeS = null 
    trigger gg_trg_TimeA = null 
    trigger gg_trg_NLS = null 
    trigger gg_trg_NLA = null 
    trigger gg_trg_NLL = null 
    trigger gg_trg_LRS = null 
    trigger gg_trg_LRA = null 
    trigger gg_trg_SNagaS = null 
    trigger gg_trg_SNagaA = null 
    trigger gg_trg_SNagaD = null 
    trigger gg_trg_GDA = null 
    trigger gg_trg_GDS = null 
    trigger gg_trg_LMA = null 
    trigger gg_trg_LMS = null 
    trigger gg_trg_PAS = null 
    trigger gg_trg_PAA = null 
    trigger gg_trg_SSA = null 
    trigger gg_trg_SSS = null 
    trigger gg_trg_SSH = null 
endglobals 

function InitGlobals takes nothing returns nothing 
    local integer i = 0 
    set udg_U = null 
    set udg_Group = CreateGroup() 
    set udg_Player = CreateForce() 
    set udg_i = 0 
    set udg_n = 0 
    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_Heronumber[i] = 0 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 40) 
        set udg_ComHero[i] = null 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 18) 
        set udg_SpellTarget[i] = null 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_ExtraHero[i] = null 
        set i = i + 1 
    endloop 

    set udg_Cameraheigh = 2000.00 
    set udg_HeroGroup = bj_lastCreatedGroup 
    set udg_UG = null 
    set udg_X = 0 
    set udg_Y = 0 
    set i = 0 
    loop 
        exitwhen(i > 15) 
        set udg_Chaoxi[i] = 0 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_Silinglong[i] = null 
        set i = i + 1 
    endloop 

    set udg_Re = 0 
    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_PX[i] = 0 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_PY[i] = 0 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_DianGroup[i] = CreateGroup() 
        set i = i + 1 
    endloop 

    set udg_testmode = 0 
    set udg_testhero = null 
    set udg_testheroplayer = 0 
    set udg_lockcamara = 0 
    set udg_NullGroup = CreateGroup() 
    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_UGharm[i] = 0 
        set i = i + 1 
    endloop 

    set udg_BlueTeamHero = CreateGroup() 
    set udg_RedTeamHero = CreateGroup() 
    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_TimerBoolean[i] = 0 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 20) 
        set udg_HelperHero[i] = null 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 2) 
        set udg_HelpeeHero[i] = null 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_SpellTimer[i] = 0 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_DeathTimer[i] = 0 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 12) 
        set udg_RacePlayerNum[i] = 0 
        set i = i + 1 
    endloop 

    set i = 0 
    loop 
        exitwhen(i > 8) 
        set udg_HeroRandomNum[i] = 0 
        set i = i + 1 
    endloop 

    set udg_ItemRandomNum = 8 
    set udg_Observer = 'Efur' 
    set udg_ActionIndex = 0 
    set udg_ActionScale = 1.00 
endfunction 

//*************************************************************************** 
//* 
//*  Unit Item Tables 
//* 
//*************************************************************************** 

function Unit000040_DropItems takes nothing returns nothing 
    local widget trigWidget = null 
    local unit trigUnit = null 
    local integer itemID = 0 
    local boolean canDrop = true 

    set trigWidget = bj_lastDyingWidget 
    if(trigWidget == null) then 
        set trigUnit = GetTriggerUnit() 
    endif 

    if(trigUnit != null) then 
        set canDrop = not IsUnitHidden(trigUnit) 
        if(canDrop and GetChangingUnit() != null) then 
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE)) 
        endif 
    endif 

    if(canDrop) then 
        // Item set 0 
        call RandomDistReset() 
        call RandomDistAddItem('tkno', 33) 
        call RandomDistAddItem('manh', 33) 
        call RandomDistAddItem('tpow', 34) 
        set itemID = RandomDistChoose() 
        if(trigUnit != null) then 
            call UnitDropItem(trigUnit, itemID) 
        else 
            call WidgetDropItem(trigWidget, itemID) 
        endif 

        // Item set 1 
        call RandomDistReset() 
        call RandomDistAddItem('tkno', 33) 
        call RandomDistAddItem('tpow', 33) 
        call RandomDistAddItem('manh', 34) 
        set itemID = RandomDistChoose() 
        if(trigUnit != null) then 
            call UnitDropItem(trigUnit, itemID) 
        else 
            call WidgetDropItem(trigWidget, itemID) 
        endif 

        // Item set 2 
        call RandomDistReset() 
        call RandomDistAddItem('rwat', 34) 
        call RandomDistAddItem('rreb', 33) 
        call RandomDistAddItem('gfor', 33) 
        set itemID = RandomDistChoose() 
        if(trigUnit != null) then 
            call UnitDropItem(trigUnit, itemID) 
        else 
            call WidgetDropItem(trigWidget, itemID) 
        endif 

    endif 

    set bj_lastDyingWidget = null 
    call DestroyTrigger(GetTriggeringTrigger()) 
endfunction 


//*************************************************************************** 
//* 
//*  Sounds 
//* 
//*************************************************************************** 

function InitSounds takes nothing returns nothing 
    set gg_snd_SacrificeUnit = CreateSound("Abilities\\Spells\\Other\\ANsa\\SacrificeUnit.wav", false, false, false, 10, 10, "DefaultEAXON") 
    call SetSoundParamsFromLabel(gg_snd_SacrificeUnit, "SacrificeUnit") 
    call SetSoundDuration(gg_snd_SacrificeUnit, 2693) 
    call SetSoundChannel(gg_snd_SacrificeUnit, 0) 
    set gg_snd_PandarenUltimate = CreateSound("Abilities\\Spells\\Other\\StormEarthFire\\PandarenUltimate.wav", false, false, false, 10, 10, "SpellsEAX") 
    call SetSoundParamsFromLabel(gg_snd_PandarenUltimate, "StormEarthFireSound") 
    call SetSoundDuration(gg_snd_PandarenUltimate, 3251) 
endfunction 

//*************************************************************************** 
//* 
//*  Unit Creation 
//* 
//*************************************************************************** 

//=========================================================================== 
function CreateNeutralHostile takes nothing returns nothing 
    local player p = Player(PLAYER_NEUTRAL_AGGRESSIVE) 
    local unit u 
    local integer unitID 
    local trigger t 
    local real life 

    set u = CreateUnit(p, 'nbwm', -13.2, -7258.8, 235.510) 
    call SetUnitAcquireRange(u, 200.0) 
    set t = CreateTrigger() 
    call TriggerRegisterUnitEvent(t, u, EVENT_UNIT_DEATH) 
    call TriggerRegisterUnitEvent(t, u, EVENT_UNIT_CHANGE_OWNER) 
    call TriggerAddAction(t, function Unit000040_DropItems) 
endfunction 

//=========================================================================== 
function CreateNeutralPassiveBuildings takes nothing returns nothing 
    local player p = Player(PLAYER_NEUTRAL_PASSIVE) 
    local unit u 
    local integer unitID 
    local trigger t 
    local real life 

    set u = CreateUnit(p, 'ngol', 1600.0, 10112.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 7424.0, 9472.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 10048.0, 2496.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -4096.0, 10048.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -3456.0, 6016.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -6016.0, 1088.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -3328.0, -10624.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -1984.0, -6528.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'nmrk', -1920.0, 896.0, 270.000) 
    call SetUnitColor(u, ConvertPlayerColor(0)) 
    set u = CreateUnit(p, 'ngol', 448.0, 6016.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -10112.0, 7936.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -5504.0, 4672.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 1600.0, -10496.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 1984.0, -6208.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -10112.0, 2112.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -10304.0, -2816.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -6656.0, -2816.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 4288.0, 5504.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -9216.0, -9216.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -5632.0, -6144.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 5376.0, -5632.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 7872.0, -9728.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 6720.0, -832.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 5824.0, 2112.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 10112.0, -4032.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 4608.0, -10240.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -6400.0, -10176.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -640.0, -10304.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', -10304.0, -6016.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ngol', 9536.0, -7424.0, 270.000) 
    call SetResourceAmount(u, 50000) 
    set u = CreateUnit(p, 'ntav', -1984.0, -1856.0, 270.000) 
    call SetUnitColor(u, ConvertPlayerColor(0)) 
    set u = CreateUnit(p, 'ngme', 1088.0, -1856.0, 270.000) 
    set u = CreateUnit(p, 'nfoh', 1088.0, 1088.0, 270.000) 
endfunction 

//=========================================================================== 
function CreatePlayerBuildings takes nothing returns nothing 
endfunction 

//=========================================================================== 
function CreatePlayerUnits takes nothing returns nothing 
endfunction 

//=========================================================================== 
function CreateAllUnits takes nothing returns nothing 
    call CreateNeutralPassiveBuildings() 
    call CreatePlayerBuildings() 
    call CreateNeutralHostile() 
    call CreatePlayerUnits() 
endfunction 

//*************************************************************************** 
//* 
//*  Custom Script Code 
//* 
//*************************************************************************** 
function Removedebuff takes unit u returns nothing 
    call UnitRemoveAbility(u, 'BHbd') 
    call UnitRemoveAbility(u, 'BHfs') 
    call UnitRemoveAbility(u, 'BHtc') 
    call UnitRemoveAbility(u, 'BHbn') 
    call UnitRemoveAbility(u, 'Bclf') 
    call UnitRemoveAbility(u, 'Bslo') 
    call UnitRemoveAbility(u, 'Bpxf') 
    call UnitRemoveAbility(u, 'Bply') 
    call UnitRemoveAbility(u, 'Bmlt') 
    call UnitRemoveAbility(u, 'Bspl') 
    call UnitRemoveAbility(u, 'BOeq') 
    call UnitRemoveAbility(u, 'BOhx') 
    call UnitRemoveAbility(u, 'Bprg') 
    call UnitRemoveAbility(u, 'Bliq') 
    call UnitRemoveAbility(u, 'Bbof') 
    call UnitRemoveAbility(u, 'Beng') 
    call UnitRemoveAbility(u, 'Bena') 
    call UnitRemoveAbility(u, 'Bens') 
    call UnitRemoveAbility(u, 'Blsh') 
    call UnitRemoveAbility(u, 'BUim') 
    call UnitRemoveAbility(u, 'Bfrz') 
    call UnitRemoveAbility(u, 'Bspa') 
    call UnitRemoveAbility(u, 'Bcri') 
    call UnitRemoveAbility(u, 'Bapl') 
    call UnitRemoveAbility(u, 'Bweb') 
    call UnitRemoveAbility(u, 'Bwea') 
    call UnitRemoveAbility(u, 'Bcrs') 
    call UnitRemoveAbility(u, 'BEsh') 
    call UnitRemoveAbility(u, 'BEer') 
    call UnitRemoveAbility(u, 'Bssd') 
    call UnitRemoveAbility(u, 'Bspo') 
    call UnitRemoveAbility(u, 'Bfae') 
    call UnitRemoveAbility(u, 'Bcor') 
    call UnitRemoveAbility(u, 'BNvc') 
    call UnitRemoveAbility(u, 'BNcs') 
    call UnitRemoveAbility(u, 'BNso') 
    call UnitRemoveAbility(u, 'BNic') 
    call UnitRemoveAbility(u, 'BNab') 
    call UnitRemoveAbility(u, 'BIcb') 
    call UnitRemoveAbility(u, 'BNpa') 
    call UnitRemoveAbility(u, 'BNpm') 
    call UnitRemoveAbility(u, 'BNmr') 
    call UnitRemoveAbility(u, 'BNht') 
    call UnitRemoveAbility(u, 'BNdo') 
    call UnitRemoveAbility(u, 'Bpsd') 
    call UnitRemoveAbility(u, 'Bpoi') 
    call UnitRemoveAbility(u, 'BNsi') 
    call UnitRemoveAbility(u, 'BNbf') 
    call UnitRemoveAbility(u, 'BNrd') 
    call UnitRemoveAbility(u, 'Bfro') 
    call UnitRemoveAbility(u, 'BSTN') 
    call UnitRemoveAbility(u, 'BPSE') 
    call UnitRemoveAbility(u, 'BNdh') 
    call UnitRemoveAbility(u, 'BCtc') 
    call UnitRemoveAbility(u, 'BCbf') 
    call UnitRemoveAbility(u, 'Btsp') 
    call UnitRemoveAbility(u, 'B000') 
    call UnitRemoveAbility(u, 'B001') 
    call UnitRemoveAbility(u, 'B004') 
    call UnitRemoveAbility(u, 'B006') 
    call UnitRemoveAbility(u, 'B007') 
    call UnitRemoveAbility(u, 'B008') 
    call UnitRemoveAbility(u, 'B00B') 
    call UnitRemoveAbility(u, 'B00C') 
    call UnitRemoveAbility(u, 'B00E') 
    call UnitRemoveAbility(u, 'B00G') 
    call UnitRemoveAbility(u, 'B00M') 
    call UnitRemoveAbility(u, 'B00N') 
    call UnitRemoveAbility(u, 'B00I') 
    call UnitRemoveAbility(u, 'B00Q') 
    call UnitRemoveAbility(u, 'B00R') 
    call UnitRemoveAbility(u, 'B00S') 
    call UnitRemoveAbility(u, 'B00T') 
    call UnitRemoveAbility(u, 'B00W') 
    call UnitRemoveAbility(u, 'B00V') 
    call UnitRemoveAbility(u, 'B00X') 
    call UnitRemoveAbility(u, 'B00Y') 
    call UnitRemoveAbility(u, 'B00Z') 
    call UnitRemoveAbility(u, 'B012') 
    call UnitRemoveAbility(u, 'B013') 
    call UnitRemoveAbility(u, 'B014') 
    call UnitRemoveAbility(u, 'B015') 
    call UnitRemoveAbility(u, 'B01H') 
    call UnitRemoveAbility(u, 'B01I') 
    call UnitRemoveAbility(u, 'B01L') 
    call UnitRemoveAbility(u, 'B01O') 
    call UnitRemoveAbility(u, 'B01P') 
    call UnitRemoveAbility(u, 'B01Q') 
    call UnitRemoveAbility(u, 'B01R') 
    call UnitRemoveAbility(u, 'B01S') 
    call UnitRemoveAbility(u, 'B01W') 
    call UnitRemoveAbility(u, 'B01X') 
    call UnitRemoveAbility(u, 'A08R') 
    call UnitRemoveAbility(u, 'B024') 
    call UnitRemoveAbility(u, 'A09I') 
    call UnitRemoveAbility(u, 'B025') 
    call UnitRemoveAbility(u, 'B026') 
    call UnitRemoveAbility(u, 'B027') 
    call UnitRemoveAbility(u, 'Bshs') 
    call UnitRemoveAbility(u, 'B02A') 
    call UnitRemoveAbility(u, 'B02B') 
    call UnitRemoveAbility(u, 'B02C') 
endfunction 

function CheckLinken takes unit u returns boolean 
    call SetUnitFacing(udg_SpellTarget[17], 57.296 * Atan2(GetUnitY(u) -10000, GetUnitX(u) -10000)) 
    call IssueTargetOrderById(udg_SpellTarget[17], 852209, u) 
    if GetUnitAbilityLevel(u, 'B029') > 0 then 
        call UnitRemoveAbility(u, 'B029') 
        return true 
    endif 
    return false 
endfunction 

function getcorrectplayer takes unit u returns player 

    if IsUnitAlly(u, Player(5)) == true then 
        return Player(5) 
    else 
        return Player(11) 
    endif 

    return Player(5) 
endfunction 


function getenemyplayer takes unit u returns player 

    if IsUnitAlly(u, Player(5)) == true then 
        return Player(11) 
    else 
        return Player(5) 
    endif 

    return Player(5) 
endfunction 


function returnonenumberoftwo takes integer i1, integer i2 returns integer 
    local integer i = GetRandomInt(1, 2) 
    if i == 1 then 
        return i1 
    else 
        return i2 
    endif 
    return i1 
endfunction 

/////////////////////////////////////////////////////////////////////////// 
function checktimerday takes nothing returns nothing ///////////wolfman 
    local integer i = GetHandleId(GetExpiredTimer()) 
    local unit u = LoadUnitHandle(udg_hash, i, 1) 
    local integer l 
    if UnitIsSleeping(LoadUnitHandle(udg_hash, i, 2)) == true then 
        set l = R2I((GetHeroLevel(u) -5) / 5) 
        call UnitAddAbility(u, 'A05T') 
        call SetUnitAbilityLevel(u, 'A05T', l) 
        call UnitAddAbility(u, 'A05X') 
        call SetUnitAbilityLevel(u, 'A05X', l) 
        call UnitAddAbility(u, 'A060') 
        call SetUnitAbilityLevel(u, 'A060', l) 
    else 
        call UnitRemoveAbility(u, 'A05T') 
        call UnitRemoveAbility(u, 'A05X') 
        call UnitRemoveAbility(u, 'A060') 
    endif 
    set u = null 
endfunction 

///////////////////////////////////////////////////////////////checkhp//////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////// 
function checkhpheroact takes nothing returns nothing 
    local unit t = GetEnumUnit() 
    local real r = GetUnitState(t, UNIT_STATE_LIFE) 
    local integer i 
    if r > 0 and(r / GetUnitState(t, UNIT_STATE_MAX_LIFE)) < 0.5 then 
        set i = R2I(GetConvertedPlayerId(GetOwningPlayer(t)) / 7) 
        set udg_HelpeeHero[i + 1] = t 
        set udg_TimerBoolean[i + 2] = 1 
    endif 
    set t = null 
endfunction 

function checkherohp takes nothing returns nothing 
    set udg_TimerBoolean[2] = 0 
    set udg_TimerBoolean[3] = 0 
    set udg_HelpeeHero[1] = null 
    set udg_HelpeeHero[2] = null 
    call ForGroup(udg_HeroGroup, function checkhpheroact) 
    if udg_TimerBoolean[2] == 1 then 
        call IssueImmediateOrderById(udg_HelperHero[1], 852184) //sq 
        call IssueTargetOrderById(udg_HelperHero[1], 852066, udg_HelpeeHero[1]) //sq 
        call IssueImmediateOrderById(udg_HelperHero[3], 852184) //warlock 
        call IssueTargetOrderById(udg_HelperHero[5], 852066, udg_HelpeeHero[1]) //anmu 
        call IssuePointOrderById(udg_HelperHero[7], 852664, GetUnitX(udg_HelpeeHero[1]), GetUnitY(udg_HelpeeHero[1])) //zdr 
        call IssueImmediateOrderById(udg_HelperHero[9], 852183) //gugong 
        call IssueTargetOrderById(udg_HelperHero[11], 852209, udg_HelpeeHero[1]) //xuenv 
    endif 
    if udg_TimerBoolean[3] == 1 then 
        call IssueImmediateOrderById(udg_HelperHero[2], 852184) //sq 
        call IssueTargetOrderById(udg_HelperHero[2], 852066, udg_HelpeeHero[2]) //sq 
        call IssueImmediateOrderById(udg_HelperHero[4], 852184) //warlock 
        call IssueTargetOrderById(udg_HelperHero[6], 852066, udg_HelpeeHero[2]) //anmu 
        call IssuePointOrderById(udg_HelperHero[8], 852664, GetUnitX(udg_HelpeeHero[2]), GetUnitY(udg_HelpeeHero[2])) //zdr 
        call IssueImmediateOrderById(udg_HelperHero[10], 852183) //gugong 
        call IssueTargetOrderById(udg_HelperHero[12], 852209, udg_HelpeeHero[2]) //xuenv 
    endif 
endfunction 








///////////////////////////////////////////////////////////////checkhp////////////////////////////////////////////////////////////////////////// 






function controlhero takes nothing returns nothing 
    local integer n = 2 
    local integer g 


    loop 
        exitwhen n > 10 

        if n == 6 then 
            set n = 7 
        endif 

        if udg_DeathTimer[n] < 0 then 
            if udg_SpellTimer[n] <= 0 then 
                
                call IssuePointOrderById(udg_ExtraHero[n], 851983, GetUnitX(udg_LiveComHero[n]), GetUnitY(udg_LiveComHero[n])) 
            else 
                set udg_SpellTimer[n] = udg_SpellTimer[n] -1 
            endif 
        else 
            if udg_DeathTimer[n] == 0 then 
                if GetPlayerState(Player(n - 1), PLAYER_STATE_RESOURCE_FOOD_USED) > 20 then 
                    call ReviveHero(udg_ExtraHero[n], udg_PX[n], udg_PY[n], true) 
                    call SetUnitState(udg_ExtraHero[n], UNIT_STATE_MANA, GetUnitState(udg_ExtraHero[n], UNIT_STATE_MAX_MANA)) 
                    set udg_DeathTimer[n] = -1 
                endif 
            else 
                set udg_DeathTimer[n] = udg_DeathTimer[n] -1 
            endif 
        endif 
        set n = n + 1 
    endloop 

endfunction 

constant function StringNum takes nothing returns string 
return "0123456789" 
endfunction 
constant function StringABC takes nothing returns string 
return "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 
endfunction 
constant function Stringabc takes nothing returns string 
return "abcdefghijklmnopqrstuvwxyz" 
endfunction 
function S2ID takes string source returns integer 
    local integer Id = 0 
    local integer n1 = 1 
    local integer n2 = 1 
    loop 
        exitwhen(n1 > StringLength(source)) 
        loop 
            exitwhen(n2 > 10) 
            if(SubString(source, n1 - 1, n1) == SubString(StringNum(), n2 - 1, n2)) then 
                set Id = Id + R2I(('0' + n2 - 1) * Pow(256.00, I2R(StringLength(source) -n1))) 
                set n2 = n2 + 1 
            else 
                set n2 = n2 + 1 
            endif 
        endloop 
        set n2 = 1 
        loop 
            exitwhen(n2 > 26) 
            if(SubString(source, n1 - 1, n1) == SubString(StringABC(), n2 - 1, n2)) then 
                set Id = Id + R2I(I2R('A' + n2 - 1) * Pow(256.00, I2R(StringLength(source) -n1))) 
                set n2 = n2 + 1 
            else 
                set n2 = n2 + 1 
            endif 
        endloop 
        set n2 = 1 
        loop 
            exitwhen(n2 > 26) 
            if(SubString(source, n1 - 1, n1) == SubString(Stringabc(), n2 - 1, n2)) then 
                set Id = Id + R2I(('a' + n2 - 1) * Pow(256.00, I2R(StringLength(source) -n1))) 
                set n2 = n2 + 1 
            else 
                set n2 = n2 + 1 
            endif 
        endloop 
        set n2 = 1 
        set n1 = n1 + 1 
    endloop 
    return Id 
endfunction 
function ID2S takes integer int returns string 
    local string target = "" 
    local integer n = 0 
    local integer dis = 0 
    loop 
        exitwhen(int == 0) 
        set n = ModuloInteger(int, 256) 
        if(n >= '0' and n <= '9') then 
            set dis = n - '0' 
            set target = SubString(StringNum(), dis, dis + 1) + target 
        endif 
        if(n >= 'A' and n <= 'Z') then 
            set dis = n - 'A' 
            set target = SubString(StringABC(), dis, dis + 1) + target 
        endif 
        if(n >= 'a' and n <= 'z') then 
            set dis = n - 'a' 
            set target = SubString(Stringabc(), dis, dis + 1) + target 
        endif 
        set int = int / 256 
    endloop 
    return target 
endfunction