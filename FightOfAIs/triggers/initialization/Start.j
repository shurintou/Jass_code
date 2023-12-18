//===========================================================================
// Trigger: Start
//===========================================================================
function timeupsetting takes nothing returns nothing
    call DestroyTimer(GetExpiredTimer())
    call DestroyTrigger( gg_trg_learnskill )
    call DestroyTrigger( gg_trg_jianzhushengji )
    call DestroyTrigger( gg_trg_setNumber )
    //call Cheat( "warpten" )
    set udg_Chaoxi[15]=1
endfunction

function deleteunit takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction


function openplayer takes nothing returns nothing
    local player p=GetEnumPlayer()
    local race r
    local integer n=GetConvertedPlayerId(p)
    
    set udg_Chaoxi[n]=0
    set udg_UGharm[n]=0
    set udg_SpellTimer[n]=300
    call SetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD, 50000)
    call SetPlayerState( p, PLAYER_STATE_RESOURCE_LUMBER, 25000 )
    
    call SetPlayerMaxHeroesAllowed( 10, p )
    call SetPlayerAlliance( p, Player(PLAYER_NEUTRAL_AGGRESSIVE), ALLIANCE_SHARED_VISION, true )//necessary for Linken
    
    if GetPlayerController(p) == MAP_CONTROL_COMPUTER then
        set r=GetPlayerRace(p)
        if r == RACE_HUMAN then
            call TriggerRegisterPlayerUnitEventSimple( gg_trg_humbuilding, p, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
            call TriggerRegisterPlayerUnitEventSimple(gg_trg_zhujidi,p, EVENT_PLAYER_UNIT_TRAIN_FINISH )
            call SetPlayerTechResearchedSwap( 'Rhhb', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhde', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhan', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhgb', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhri', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhse', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhfl', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhss', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhrt', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhfc', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhfs', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhlh', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhac', 3, p )
            call SetPlayerTechResearchedSwap( 'Rhcd', 1, p )
            call SetPlayerTechResearchedSwap( 'Rhst', 2, p )
            call SetPlayerTechResearchedSwap( 'Rhpt', 2, p )
            call SetPlayerTechResearchedSwap( 'Rhme', 3, p )
            call SetPlayerTechResearchedSwap( 'Rhar', 3, p )
            call SetPlayerTechResearchedSwap( 'Rhla', 3, p )
            call SetPlayerTechResearchedSwap( 'Rhra', 3, p )
            if IsPlayerAlly(p,Player(5))==true then
                set udg_RacePlayerNum[1]=n//human
            else
                set udg_RacePlayerNum[2]=n//human
            endif
        elseif r== RACE_ORC then
            call TriggerRegisterPlayerUnitEventSimple(  gg_trg_orcbuilding, p, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
            call SetPlayerTechResearchedSwap( 'Rwdm', 1, p )
            call SetPlayerTechResearchedSwap( 'Robs', 1, p )
            call SetPlayerTechResearchedSwap( 'Rows', 1, p )
            call SetPlayerTechResearchedSwap( 'Roen', 1, p )
            call SetPlayerTechResearchedSwap( 'Rovs', 1, p )
            call SetPlayerTechResearchedSwap( 'Rolf', 1, p )
            call SetPlayerTechResearchedSwap( 'Rorb', 1, p )
            call SetPlayerTechResearchedSwap( 'Robk', 1, p )
            call SetPlayerTechResearchedSwap( 'Robf', 1, p )
            call SetPlayerTechResearchedSwap( 'Rotr', 1, p )
            if IsPlayerAlly(p,Player(5))==true then
                set udg_RacePlayerNum[5]=n
            else
                set udg_RacePlayerNum[6]=n
            endif
        elseif r== RACE_UNDEAD then
            call TriggerRegisterPlayerUnitEventSimple( gg_trg_udbuilding, p, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
            call SetPlayerTechMaxAllowedSwap( 'ubsp', 8, p )
            call SetPlayerTechResearchedSwap( 'Rugf', 1, p )
            call SetPlayerTechResearchedSwap( 'Ruwb', 1, p )
            call SetPlayerTechResearchedSwap( 'Rusf', 1, p )
            call SetPlayerTechResearchedSwap( 'Rufb', 1, p )
            call SetPlayerTechResearchedSwap( 'Rusp', 1, p )
            call SetPlayerTechResearchedSwap( 'Rusl', 1, p )
            call SetPlayerTechResearchedSwap( 'Rusm', 1, p )
            if IsPlayerAlly(p,Player(5))==true then
                set udg_RacePlayerNum[3]=n//undead
            else
                set udg_RacePlayerNum[4]=n//undead
            endif
        elseif r== RACE_NIGHTELF then
            call TriggerRegisterPlayerUnitEventSimple( gg_trg_nebuilding, p, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
            call SetPlayerTechMaxAllowedSwap( 'edcm', 8, p )
            call SetPlayerTechMaxAllowedSwap( 'edoc', 8, p )
            call SetPlayerTechResearchedSwap( 'Reuv', 1, p )
            call SetPlayerTechResearchedSwap( 'Renb', 1, p )
            call SetPlayerTechResearchedSwap( 'Resc', 1, p )
            call SetPlayerTechResearchedSwap( 'Remg', 1, p )
            call SetPlayerTechResearchedSwap( 'Reib', 1, p )
            call SetPlayerTechResearchedSwap( 'Remk', 1, p )
            call SetPlayerTechResearchedSwap( 'Resi', 1, p )
            call SetPlayerTechResearchedSwap( 'Recb', 1, p )
            call SetPlayerTechResearchedSwap( 'Reht', 1, p )
            call SetPlayerTechResearchedSwap( 'Repb', 1, p )
            call SetPlayerTechResearchedSwap( 'Rers', 1, p )
            call SetPlayerTechResearchedSwap( 'Rehs', 1, p )
            call SetPlayerTechResearchedSwap( 'Reeb', 1, p )
            call SetPlayerTechResearchedSwap( 'Reec', 1, p )
            call SetPlayerTechResearchedSwap( 'Redt', 2, p )
            call SetPlayerTechResearchedSwap( 'Redc', 2, p )
            if IsPlayerAlly(p,Player(5))==true then
                set udg_RacePlayerNum[7]=n
            else
                set udg_RacePlayerNum[8]=n
            endif
        endif
    endif
    call SetPlayerAbilityAvailable( p, 'A09I', false )
    set p=null
    set r=null
endfunction



function Trig_Start_Conditions takes nothing returns boolean
    local integer i=1
    local unit u
    local integer n=0
    local player p
    set udg_BlueTeamHero = CreateGroup()
    set udg_RedTeamHero = CreateGroup()
    set udg_HeroGroup = CreateGroup()
    set udg_hash = InitHashtable()
    set udg_Color[1] = PLAYER_COLOR_RED
    set udg_Color[2] = PLAYER_COLOR_BLUE
    set udg_Color[3] = PLAYER_COLOR_CYAN
    set udg_Color[4] = PLAYER_COLOR_PURPLE
    set udg_Color[5] = PLAYER_COLOR_YELLOW
    set udg_Color[6] = PLAYER_COLOR_ORANGE
    set udg_Color[7] = PLAYER_COLOR_GREEN
    set udg_Color[8] = PLAYER_COLOR_PINK
    set udg_Color[9] = PLAYER_COLOR_LIGHT_GRAY
    set udg_Color[10] = PLAYER_COLOR_LIGHT_BLUE
    set udg_Color[11] = PLAYER_COLOR_AQUA
    set udg_Color[12] = PLAYER_COLOR_BROWN
    set udg_HeroRandomNum[2]=14//human
    set udg_HeroRandomNum[4]=15//orc
    set udg_HeroRandomNum[6]=15//ud
    set udg_HeroRandomNum[8]=15//ne
    
    ////////////hero random number
    loop
        exitwhen n>11
        call ForceAddPlayer( udg_Player, Player(n) )
        set n=n+1
    endloop
    set n=1
    loop
        exitwhen n>12
        set p=ForcePickRandomPlayer(udg_Player)
        call SetPlayerColor( p, udg_Color[n] )
        call ForceRemovePlayer( udg_Player, p )
        set n=n+1
    endloop
    set n=0
    loop
        exitwhen n>11
        set udg_Color[n+1]=null
        call ForceAddPlayer( udg_Player, Player(n) )
        set n=n+1
    endloop
    call MeleeStartingVisibility(  )
    call MeleeGrantHeroItems(  )
    call MeleeStartingHeroLimit(  )
    call MeleeStartingResources(  )
    //call MeleeClearExcessUnits(  )
    call MeleeStartingUnits(  )
    call MeleeStartingAI(  )
    call MeleeInitVictoryDefeat(  )
    call SetGameSpeed( MAP_SPEED_FASTEST )
    call SetGameDifficulty( MAP_DIFFICULTY_HARD )
    call ForForce( udg_Player, function openplayer )
    call ForceClear( udg_Player )
    call DestroyForce( udg_Player )
    set udg_PreItem[1] = 'pmna'//hp
    set udg_PreItem[2] = 'odef'
    set udg_PreItem[3] = 'lhst'
    set udg_PreItem[4] = 'evtl'//de
    set udg_PreItem[5] = 'clsd'
    set udg_PreItem[6] = 'rlif'
    set udg_PreItem[7] = 'rst1'//st
    set udg_PreItem[8] = 'pmna'//st
    set udg_PreItem[9] = 'rlif'//st
    set udg_PreItem[17] = 'belv'//ar
    set udg_PreItem[18] = 'gcel'//ar
    set udg_PreItem[19] = 'srbd'//ar
    set udg_PreItem[27] = 'ciri'//ar
    set udg_PreItem[28] = 'lhst'//ar
    set udg_PreItem[29] = 'afac'//ar
    set udg_PreItem[10] = 'rde1'
    set udg_PreItem[11] = 'rde2'
    set udg_PreItem[12] = 'rde3'
    set udg_PreItem[13] = 'stwa'
    set udg_PreItem[14] = 'frgd'
    set udg_PreItem[15] = 'afac'
    set udg_PreItem[16] = 'rat3'
    set udg_Item[95] = 'esaz'
    set udg_Item[90] = 'I002'
    set udg_Item[91] = 'I00L'
    set udg_Item[92] = 'arsh'
    set udg_Item[93] = 'ssan'
    set udg_Item[94] = 'bgst'
    set udg_Item[11] = 'pams'
    set udg_Item[12] = 'I00D'
    set udg_Item[13] = 'I00F'
    set udg_Item[14] = 'kpin'
    set udg_Item[15] = 'ajen'
    set udg_Item[16] = 'hval'
    set udg_Item[17] = 'shea'//meiken
    set udg_Item[20] = 'prvt'
    set udg_Item[21] = 'I00C'
    set udg_Item[22] = 'shen'//bingjia
    set udg_Item[23] = 'shhn'
    set udg_Item[24] = 'sksh'//xianfengdun
    set udg_Item[25] = 'frhg'
    set udg_Item[26] = 'shdt'
    set udg_Item[27] = 'rde4'
    set udg_Item[30] = 'cnob'
    set udg_Item[31] = 'I00R'
    set udg_Item[32] = 'ofir'
    set udg_Item[33] = 'oli2'//sanshi
    set udg_Item[34] = 'ocor'
    set udg_Item[35] = 'I00P'
    set udg_Item[36] = 'I00E'
    set udg_Item[37] = 'ratf'
    set udg_Item[38] = 'vamp'
    set udg_Item[39] = 'I00Q'//xilandao
    set udg_Item[40] = 'ratc'//kuangzhan
    set udg_Item[41] = 'I00G'//DAPAO
    set udg_Item[42] = 'mlst'//YUNCHUI
    set udg_Item[51] = 'rat9'
    set udg_Item[52] = 'ssil'//ZIYUAN
    set udg_Item[53] = 'dtsb'//dagen
    set udg_Item[54] = 'rat6'//yangdao
    set udg_Item[55] = 'fgsk'//
    set udg_Item[56] = 'ccmd'//tongzhi
    set udg_Item[57] = 'esaz'//shuaxin
    set udg_Item[61] = 'clfm'//huiyao
    set udg_Item[62] = 'klmm'
    set udg_Item[63] = 'I001'
    set udg_Item[65] = 'I003'//jinzhan shuangzhiaishang
    set udg_Item[71] = 'rat9'
    set udg_Item[72] = 'I00J'//HUDIE
    set udg_Item[73] = 'mlst'//YUNCHUI
    set udg_Item[74] = 'I00G'//DAPAO
    set udg_Item[76] = 'srtl'
    set udg_Item[75] = 'pinv'
    set udg_Item[77] = 'ratc'
    set udg_Item[81] = 'asbl'
    set udg_NullGroup=CreateGroup()//all of the fate selction of unit into group will be added into this fate group temporarily
    call Cheat( "warpten" )
    call Cheat( "iseedeadpeople" )
    call EnableTrigger( gg_trg_camera )
    call EnableTrigger( gg_trg_darksummon )
    call EnableTrigger( gg_trg_deathcamera )
    call EnableTrigger( gg_trg_up )
    call EnableTrigger( gg_trg_down )
    call EnableTrigger( gg_trg_left )
    call EnableTrigger( gg_trg_right )
    call EnableTrigger( gg_trg_esc )
    call EnableTrigger( gg_trg_setNumber  )
    set udg_Group = GetUnitsOfPlayerAll(Player(0))
    call SetMapFlag( MAP_OBSERVERS, true )
    call SetMapFlag( MAP_OBSERVERS_ON_DEATH, true )
    call MakeUnitsPassiveForPlayer( Player(0) )
    call ForGroup( udg_Group, function deleteunit )
    call GroupClear( udg_Group )
    call DestroyGroup( udg_Group )
    call SetCameraFieldForPlayer( Player(0), CAMERA_FIELD_TARGET_DISTANCE, 2000.00, 0 )
    call TimerStart(CreateTimer(),600,false,function timeupsetting )
    set u=CreateUnit(Player(0),udg_Observer,-450,-460,270)
    set udg_ObserverUnit = u
    call SetHeroLevel( u, 30, false )
    call UnitAddAbility(u,'Avul')
    call UnitAddAbility(u,'A02I')
    call UnitAddAbility(u,'A02J')
    call UnitAddAbility(u,'A09C')
    call UnitAddAbility(u,'A0AG')
    call UnitAddAbility(u,'A0AH')
    call TriggerRegisterUnitEvent( gg_trg_darksummon, u, EVENT_UNIT_SPELL_EFFECT )
    call SetReservedLocalHeroButtons( 1 )
    call DestroyTrigger( gg_trg_code )
    call DestroyTrigger( gg_trg_GetCode )
    call DestroyTrigger( GetTriggeringTrigger() )
    call TimerStart(CreateTimer(),2,true,function controlhero)
    set udg_Gold=CreateUnit(Player(0),'u00C',0,0,0)
    set udg_SpellTarget[17] =CreateUnit( Player(PLAYER_NEUTRAL_AGGRESSIVE),'u000',10000,10000,0)
    call UnitAddAbility(udg_SpellTarget[17],'A09N')
    //call SetUnitFacing( udg_SpellTarget[17],  bj_RADTODEG * Atan2(-10000, -10000) )
    set udg_Chaoxi[1]=0
    set udg_UGharm[1]=0
    set p=null
    set u=null
    
    return false
endfunction



//===========================================================================
function InitTrig_Start takes nothing returns nothing
    set gg_trg_Start = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_Start, 5 )
    call TriggerAddCondition( gg_trg_Start, Condition( function Trig_Start_Conditions ) )
endfunction
