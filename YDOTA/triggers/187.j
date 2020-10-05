
//===========================================================================
// Trigger: 未命名触发器 187
//===========================================================================
function Trig_187_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'n01H' ) ) then
        return false
    endif
    return true
endfunction

function Trig_187_Actions takes nothing returns nothing
    call TriggerSleepAction( 80.00 )
    call CreateNUnitsAtLocFacingLocBJ( 1, 'n01H', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRectCenter(gg_rct_lanmo5), GetRectCenter(GetPlayableMapRect()) )
endfunction

//===========================================================================
function InitTrig_187 takes nothing returns nothing
    set gg_trg_187 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_187, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_187, Condition( function Trig_187_Conditions ) )
    call TriggerAddAction( gg_trg_187, function Trig_187_Actions )
endfunction
