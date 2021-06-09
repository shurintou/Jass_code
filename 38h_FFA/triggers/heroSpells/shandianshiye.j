
//===========================================================================
// Trigger: shandianshiye
//===========================================================================
function Trig_shandianshiye_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'ANmo' 
endfunction

function Trig_shandianshiye_Actions takes nothing returns nothing
call UnitApplyTimedLife( CreateUnit(GetTriggerPlayer(),'n006',GetSpellTargetX(),GetSpellTargetY(),0), 'BTLF', 60 )
endfunction

//===========================================================================
function InitTrig_shandianshiye takes nothing returns nothing
    set gg_trg_shandianshiye = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_shandianshiye, Condition( function Trig_shandianshiye_Conditions ) )
    call TriggerAddAction( gg_trg_shandianshiye, function Trig_shandianshiye_Actions )
endfunction
