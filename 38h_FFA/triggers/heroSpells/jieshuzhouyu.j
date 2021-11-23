
//===========================================================================
// Trigger: jieshuzhouyu
//===========================================================================
function Trig_jieshuzhouyu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A099' 
endfunction

function Trig_jieshuzhouyu_Actions takes nothing returns nothing
local timer tm=LoadTimerHandle(udg_Hash1,GetHandleId(GetTriggerUnit()),819)
local integer i=GetHandleId(tm)
local group g=LoadGroupHandle(udg_Hash1,i,2)
call RemoveUnit(LoadUnitHandle(udg_Hash1,i,5))
call RemoveLocation(LoadLocationHandle(udg_Hash1,i,6))
call GroupClear(g)
call DestroyGroup(g)
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
set tm=null
set g=null
endfunction

//===========================================================================
function InitTrig_jieshuzhouyu takes nothing returns nothing
    set gg_trg_jieshuzhouyu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_jieshuzhouyu, Condition( function Trig_jieshuzhouyu_Conditions ) )
    call TriggerAddAction( gg_trg_jieshuzhouyu, function Trig_jieshuzhouyu_Actions )
endfunction
