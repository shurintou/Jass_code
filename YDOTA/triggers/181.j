
//===========================================================================
// Trigger: 未命名触发器 181
//===========================================================================
function Trig_181_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'ndrs' ) ) then
        return false
    endif
    return true
endfunction

function Trig_181_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call CreateNUnitsAtLocFacingLocBJ( 1, 'ndrs', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRectCenter(gg_rct_lanmo2), GetRectCenter(GetPlayableMapRect()) )
endfunction

//===========================================================================
function InitTrig_181 takes nothing returns nothing
    set gg_trg_181 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_181, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_181, Condition( function Trig_181_Conditions ) )
    call TriggerAddAction( gg_trg_181, function Trig_181_Actions )
endfunction
