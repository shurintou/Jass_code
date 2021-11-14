
//===========================================================================
// Trigger: zhunbeihuichun
//===========================================================================
function Trig_zhunbeihuichun_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0CF' 
endfunction

function Trig_zhunbeihuichun_Actions takes nothing returns nothing
local integer i=GetHandleId(gg_trg_zhunbeihuichun)
call SaveUnitHandle(udg_Hash1,i,3,GetSpellTargetUnit())
endfunction

//===========================================================================
function InitTrig_zhunbeihuichun takes nothing returns nothing
    set gg_trg_zhunbeihuichun = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zhunbeihuichun, Condition( function Trig_zhunbeihuichun_Conditions ) )
    call TriggerAddAction( gg_trg_zhunbeihuichun, function Trig_zhunbeihuichun_Actions )
endfunction
