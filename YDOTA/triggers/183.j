
//===========================================================================
// Trigger: 未命名触发器 183
//===========================================================================
function Trig_183_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'n01F' ) ) then
        return false
    endif
    return true
endfunction

function Trig_183_Actions takes nothing returns nothing
    call TriggerSleepAction( 60.00 )
    call CreateNUnitsAtLocFacingLocBJ( 1, 'n01F', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRectCenter(gg_rct_lanmo3), GetRectCenter(GetPlayableMapRect()) )
endfunction

//===========================================================================
function InitTrig_183 takes nothing returns nothing
    set gg_trg_183 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_183, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_183, Condition( function Trig_183_Conditions ) )
    call TriggerAddAction( gg_trg_183, function Trig_183_Actions )
endfunction
