
//===========================================================================
// Trigger: 未命名触发器 180
//===========================================================================
function Trig_180_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'nomg' ) ) then
        return false
    endif
    return true
endfunction

function Trig_180_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call CreateNUnitsAtLocFacingLocBJ( 1, 'nomg', Player(PLAYER_NEUTRAL_AGGRESSIVE), GetRectCenter(gg_rct_lanmo1), GetRectCenter(GetPlayableMapRect()) )
endfunction

//===========================================================================
function InitTrig_180 takes nothing returns nothing
    set gg_trg_180 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_180, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_180, Condition( function Trig_180_Conditions ) )
    call TriggerAddAction( gg_trg_180, function Trig_180_Actions )
endfunction
