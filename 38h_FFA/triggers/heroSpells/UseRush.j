
//===========================================================================
// Trigger: UseRush
//===========================================================================
function Trig_UseRush_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03O' 
endfunction

function RemoveRush takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local player p=GetOwningPlayer(u)

call UnitRemoveAbility(u,'Amgl')
call SetPlayerAbilityAvailable( p, 'A03O', true )
call SetPlayerAbilityAvailable( p, 'A03R', false )
call UnitRemoveAbility(u,'B012')
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set u=null
set p=null
endfunction


function Trig_UseRush_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local integer i=GetHandleId(tm)
local player p=GetOwningPlayer(u)


call SaveUnitHandle(udg_Hash1,i,1,u)
call SetPlayerAbilityAvailable( p, 'A03O', false )
call SetPlayerAbilityAvailable( p, 'A03R', true)
call UnitAddAbility(u,'Amgl')
call UnitAddAbility(u,'B012')


call TimerStart(tm,20,false,function RemoveRush)

set tm=null
set u=null
set p=null
endfunction

//===========================================================================
function InitTrig_UseRush takes nothing returns nothing
    set gg_trg_UseRush = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_UseRush, Condition( function Trig_UseRush_Conditions ) )
    call TriggerAddAction( gg_trg_UseRush, function Trig_UseRush_Actions )
endfunction
