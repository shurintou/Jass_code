
//===========================================================================
// Trigger: spellchaoqiang
//===========================================================================
function Trig_spellchaoqiang_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0BJ' 
endfunction

function Trig_spellchaoqiang_Actions takes nothing returns nothing
call SaveInteger(udg_Hash1,GetHandleId(gg_trg_chaoqiangstrong),4,0)
endfunction

//===========================================================================
function InitTrig_spellchaoqiang takes nothing returns nothing
    set gg_trg_spellchaoqiang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_spellchaoqiang, Condition( function Trig_spellchaoqiang_Conditions ) )
    call TriggerAddAction( gg_trg_spellchaoqiang, function Trig_spellchaoqiang_Actions )
endfunction
