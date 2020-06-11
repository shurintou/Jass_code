
//===========================================================================
// Trigger: 未命名触发器 110
//===========================================================================
function Trig_110_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_110_Actions takes nothing returns nothing
    call AdjustPlayerStateBJ( 100, GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_GOLD )
endfunction

//===========================================================================
function InitTrig_110 takes nothing returns nothing
    set gg_trg_110 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_110, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_110, Condition( function Trig_110_Conditions ) )
    call TriggerAddAction( gg_trg_110, function Trig_110_Actions )
endfunction
