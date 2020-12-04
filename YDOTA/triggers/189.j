
//===========================================================================
// Trigger: 未命名触发器 189
//===========================================================================
function Trig_189_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'n01K' ) ) then
        return false
    endif
    return true
endfunction

function Trig_189_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call CreateNUnitsAtLocFacingLocBJ( 1, 'n01K', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRectCenter(gg_rct_lemon8), GetRectCenter(GetPlayableMapRect()) )
endfunction

//===========================================================================
function InitTrig_189 takes nothing returns nothing
    set gg_trg_189 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_189, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_189, Condition( function Trig_189_Conditions ) )
    call TriggerAddAction( gg_trg_189, function Trig_189_Actions )
endfunction
