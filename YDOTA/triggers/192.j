
//===========================================================================
// Trigger: 未命名触发器 192
//===========================================================================
function Trig_192_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(PLAYER_NEUTRAL_AGGRESSIVE) ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(2) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_192_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( ( "|cff1ce6b9" + ( ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + GetUnitName(GetDyingUnit()) ) ) + "被中立生物杀死了！难道他想给中立生物练级吗？" ) ) + "|r " ) )
endfunction

//===========================================================================
function InitTrig_192 takes nothing returns nothing
    set gg_trg_192 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_192, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_192, Condition( function Trig_192_Conditions ) )
    call TriggerAddAction( gg_trg_192, function Trig_192_Actions )
endfunction
