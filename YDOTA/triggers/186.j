
//===========================================================================
// Trigger: 未命名触发器 186
//===========================================================================
function Trig_186_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'n01I' ) ) then
        return false
    endif
    return true
endfunction

function Trig_186_Actions takes nothing returns nothing
    call TriggerSleepAction( 80.00 )
    call CreateNUnitsAtLocFacingLocBJ( 1, 'n01I', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRectCenter(gg_rct_lanmo7), GetRectCenter(GetPlayableMapRect()) )
endfunction

//===========================================================================
function InitTrig_186 takes nothing returns nothing
    set gg_trg_186 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_186, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_186, Condition( function Trig_186_Conditions ) )
    call TriggerAddAction( gg_trg_186, function Trig_186_Actions )
endfunction
