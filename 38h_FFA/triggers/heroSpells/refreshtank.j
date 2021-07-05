
//===========================================================================
// Trigger: refreshtank
//
// 王WZ是马脸等一党稀烂的初中同学，
//===========================================================================
function Trig_refreshtank_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A00K' 
endfunction

function Trig_refreshtank_Actions takes nothing returns nothing
    call UnitResetCooldown( GetTriggerUnit() )
endfunction

//===========================================================================
function InitTrig_refreshtank takes nothing returns nothing
    set gg_trg_refreshtank = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_refreshtank, Condition( function Trig_refreshtank_Conditions ) )
    call TriggerAddAction( gg_trg_refreshtank, function Trig_refreshtank_Actions )
endfunction
