
//===========================================================================
// Trigger: CreateWeatherd
//
// call UnitAddAbility( null, 'A041' )
// call SetUnitAbilityLevel( null, 'A041', GetUnitAbilityLevel(GetTriggerUnit(), 'A041') )
// call SetPlayerAbilityAvailable( Player(0), 'A041', false )
// call UnitApplyTimedLife( null, 'BTLF', 60 )
// call SetUnitState( null, UNIT_STATE_LIFE, GetUnitState(GetTriggerUnit(), UNIT_STATE_LIFE) )
// call SetUnitState( null, UNIT_STATE_MANA, GetUnitState(GetTriggerUnit(), UNIT_STATE_MANA) )
//===========================================================================
function Trig_CreateWeatherd_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03S' 
endfunction

function Trig_CreateWeatherd_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)

call UnitAddAbility( m, 'A044' )
call UnitApplyTimedLife( m, 'BTLF', 5 )
call SetUnitAbilityLevel( m, 'A044', GetUnitAbilityLevel(u, 'A03S') )
call IssuePointOrderById( m, 852221, GetUnitX(u),GetUnitY(u) )
call SaveUnitHandle(udg_Hash1,GetHandleId(u),249,m)

if udg_WeatherN==2 then
call UnitAddAbility( m, 'A0AY' )
endif

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_CreateWeatherd takes nothing returns nothing
    set gg_trg_CreateWeatherd = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_CreateWeatherd, Condition( function Trig_CreateWeatherd_Conditions ) )
    call TriggerAddAction( gg_trg_CreateWeatherd, function Trig_CreateWeatherd_Actions )
endfunction
