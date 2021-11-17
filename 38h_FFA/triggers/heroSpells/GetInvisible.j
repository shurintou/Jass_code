
//===========================================================================
// Trigger: GetInvisible
//
// call UnitAddAbility( null, 'A00F' )
//     call UnitRemoveAbility( null, 'A00K' )
//===========================================================================
function Trig_GetInvisible_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'AOsf' 
endfunction


function RemoveInvisible takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)

call UnitRemoveAbility(u,'Amgr')
call UnitRemoveAbility(u,'Agho')
call UnitRemoveAbility(u,'Apiv')
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'AOsf', true )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set u=null
endfunction


function Trig_GetInvisible_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()

call UnitRemoveBuffs( u, true, true )
call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,u)
call TimerStart(tm,5.5,false,function RemoveInvisible)
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'AOsf', false )
call UnitAddAbility(u,'Amgr')
call UnitAddAbility(u,'Agho')
call UnitAddAbility(u,'Apiv')

set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_GetInvisible takes nothing returns nothing
    set gg_trg_GetInvisible = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_GetInvisible, Condition( function Trig_GetInvisible_Conditions ) )
    call TriggerAddAction( gg_trg_GetInvisible, function Trig_GetInvisible_Actions )
endfunction
