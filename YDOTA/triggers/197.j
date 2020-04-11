
//===========================================================================
// Trigger: 未命名触发器 197
//===========================================================================
function Trig_197_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(PLAYER_NEUTRAL_AGGRESSIVE) ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(7) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_197_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( ( "|cffd55bb0" + ( ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + GetUnitName(GetDyingUnit()) ) ) + "被中立生物杀死了！难道他想不开吗？" ) ) + "|r " ) )
endfunction

//===========================================================================
function InitTrig_197 takes nothing returns nothing
    set gg_trg_197 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_197, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_197, Condition( function Trig_197_Conditions ) )
    call TriggerAddAction( gg_trg_197, function Trig_197_Actions )
endfunction
