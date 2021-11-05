
//===========================================================================
// Trigger: GodGoDown
//===========================================================================
function Trig_GodGoDown_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'AHav' 
endfunction


function godgoup takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)

call UnitRemoveAbility( LoadUnitHandle(udg_Hash1,i,1), 'A06W' )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
endfunction



function Trig_GodGoDown_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer level=GetUnitAbilityLevel(u, 'AHav')

call UnitAddAbility( u, 'A06W' )
call SetUnitAbilityLevel( u, 'A06W', level )
call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,u)
call TimerStart(tm,6+level*2,false,function godgoup)

set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_GodGoDown takes nothing returns nothing
    set gg_trg_GodGoDown = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_GodGoDown, Condition( function Trig_GodGoDown_Conditions ) )
    call TriggerAddAction( gg_trg_GodGoDown, function Trig_GodGoDown_Actions )
endfunction
