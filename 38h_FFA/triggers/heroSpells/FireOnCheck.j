
//===========================================================================
// Trigger: FireOnCheck
//===========================================================================
function Trig_FireOnCheck_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true 
endfunction

function Trig_FireOnCheck_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit t=GetEventTargetUnit()

if LoadUnitHandle(udg_Hash1,GetHandleId(u),63)==t then
else
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'AEar', false )
call UnitRemoveAbility(u,'B011')
call UnitRemoveAbility(u,'A03E')
endif

set u=null
set t=null
endfunction

//===========================================================================
function InitTrig_FireOnCheck takes nothing returns nothing
    set gg_trg_FireOnCheck = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_FireOnCheck, Condition( function Trig_FireOnCheck_Conditions ) )
    call TriggerAddAction( gg_trg_FireOnCheck, function Trig_FireOnCheck_Actions )
endfunction
