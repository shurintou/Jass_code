
//===========================================================================
// Trigger: 未命名触发器 188
//===========================================================================
function Trig_188_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'n01J' ) ) then
        return false
    endif
    return true
endfunction

function Trig_188_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call CreateNUnitsAtLocFacingLocBJ( 1, 'n01J', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRectCenter(gg_rct_lemon9), GetRectCenter(GetPlayableMapRect()) )
endfunction

//===========================================================================
function InitTrig_188 takes nothing returns nothing
    set gg_trg_188 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_188, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_188, Condition( function Trig_188_Conditions ) )
    call TriggerAddAction( gg_trg_188, function Trig_188_Actions )
endfunction
