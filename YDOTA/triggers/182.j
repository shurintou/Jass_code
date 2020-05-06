
//===========================================================================
// Trigger: 未命名触发器 182
//===========================================================================
function Trig_182_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'n01E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_182_Actions takes nothing returns nothing
    call TriggerSleepAction( 60.00 )
    call CreateNUnitsAtLocFacingLocBJ( 1, 'n01E', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRectCenter(gg_rct_lanmo4), GetRectCenter(GetPlayableMapRect()) )
endfunction

//===========================================================================
function InitTrig_182 takes nothing returns nothing
    set gg_trg_182 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_182, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_182, Condition( function Trig_182_Conditions ) )
    call TriggerAddAction( gg_trg_182, function Trig_182_Actions )
endfunction
