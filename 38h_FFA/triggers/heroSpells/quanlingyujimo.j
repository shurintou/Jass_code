
//===========================================================================
// Trigger: quanlingyujimo
//===========================================================================
function Trig_quanlingyujimo_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08Z' 
endfunction

function hfghf takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
call ResumeMusic(  )
call UnitRemoveAbility( u, 'Amgr' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A08Z', true )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
set tm=null
set u=null
endfunction

function chenmo takes nothing returns nothing
local unit t=GetEnumUnit()
local unit m
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_quanlingyujimo),1)

if IsUnitAlly(t, GetOwningPlayer(u)) == false then
set m=CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE),'n001',0,0,0)
call UnitAddAbility(m,'A090')
call UnitApplyTimedLife( m, 'BTLF', 10 )
if udg_WeatherN==3 then
call SetUnitAbilityLevel(m,'A090',GetUnitAbilityLevel(u,'A08Z')+3)
else
call SetUnitAbilityLevel(m,'A090',GetUnitAbilityLevel(u,'A08Z'))
endif
call IssueTargetOrderById( m, 852668, t )
endif
set t=null
set u=null
set m=null
endfunction


function Trig_quanlingyujimo_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
//set udg_lsu=u
call StopMusic( true )
call PlaySoundOnUnitBJ( gg_snd_Silence1, 100, u )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A08Z', false )
call UnitAddAbility( u, 'Amgr' )
call ForGroup(udg_CheckHpGroup,function chenmo)
call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,u)
call TimerStart(tm,GetUnitAbilityLevel(u,'A08Z')+2,false,function hfghf)
set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_quanlingyujimo takes nothing returns nothing
    set gg_trg_quanlingyujimo = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_quanlingyujimo, Condition( function Trig_quanlingyujimo_Conditions ) )
    call TriggerAddAction( gg_trg_quanlingyujimo, function Trig_quanlingyujimo_Actions )
endfunction
