
//===========================================================================
// Trigger: yeman
//===========================================================================
function Trig_yeman_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A01O' ) ) then
        return false
    endif
    return true
endfunction

function Trig_yeman_Actions takes nothing returns nothing
    set udg_niutouweizhi = GetUnitLoc(GetTriggerUnit())
    set udg_Niutou = GetTriggerUnit()
    set udg_wanjia = GetTriggerPlayer()
    call SetUnitPathing( udg_Niutou, false )
    call TriggerSleepAction( 1.00 )
    call EnableTrigger( gg_trg_yidong )
    call TriggerSleepAction( 0.01 )
    call EnableTrigger( gg_trg_shanghai_u )
endfunction

//===========================================================================
function InitTrig_yeman takes nothing returns nothing
    set gg_trg_yeman = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_yeman, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_yeman, Condition( function Trig_yeman_Conditions ) )
    call TriggerAddAction( gg_trg_yeman, function Trig_yeman_Actions )
endfunction
