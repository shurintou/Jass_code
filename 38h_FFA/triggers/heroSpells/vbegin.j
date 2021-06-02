
//===========================================================================
// Trigger: vbegin
//===========================================================================
function Trig_vbegin_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08P' 
endfunction

function Trig_vbegin_Actions takes nothing returns nothing
local integer i=GetHandleId(GetTriggerUnit())
call SaveReal(udg_Hash1,i,217,GetSpellTargetX())
call SaveReal(udg_Hash1,i,218,GetSpellTargetY())
endfunction

//===========================================================================
function InitTrig_vbegin takes nothing returns nothing
    set gg_trg_vbegin = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_vbegin, Condition( function Trig_vbegin_Conditions ) )
    call TriggerAddAction( gg_trg_vbegin, function Trig_vbegin_Actions )
endfunction
