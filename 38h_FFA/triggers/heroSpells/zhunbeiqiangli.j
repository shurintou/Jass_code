
//===========================================================================
// Trigger: zhunbeiqiangli
//
// 强力箭雨储存于此触发
//===========================================================================
function Trig_zhunbeiqiangli_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0C1' 
endfunction

function Trig_zhunbeiqiangli_Actions takes nothing returns nothing
local integer i=GetHandleId(gg_trg_zhunbeiqiangli)
call SetUnitTimeScale( GetTriggerUnit(), 3.00 )
call SaveReal(udg_Hash1,i,3,GetSpellTargetX())
call SaveReal(udg_Hash1,i,4,GetSpellTargetY())
endfunction

//===========================================================================
function InitTrig_zhunbeiqiangli takes nothing returns nothing
    set gg_trg_zhunbeiqiangli = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zhunbeiqiangli, Condition( function Trig_zhunbeiqiangli_Conditions ) )
    call TriggerAddAction( gg_trg_zhunbeiqiangli, function Trig_zhunbeiqiangli_Actions )
endfunction
