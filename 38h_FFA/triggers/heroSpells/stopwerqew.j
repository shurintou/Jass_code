
//===========================================================================
// Trigger: stopwerqew
//===========================================================================
function Trig_stopwerqew_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03M' 
endfunction

function Trig_stopwerqew_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=LoadTimerHandle(udg_Hash1,GetHandleId(u),627)
call FlushChildHashtable( udg_Hash1, GetHandleId(tm) )
call PauseTimer(tm)
call DestroyTimer(tm)
set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_stopwerqew takes nothing returns nothing
    set gg_trg_stopwerqew = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_stopwerqew, Condition( function Trig_stopwerqew_Conditions ) )
    call TriggerAddAction( gg_trg_stopwerqew, function Trig_stopwerqew_Actions )
endfunction
