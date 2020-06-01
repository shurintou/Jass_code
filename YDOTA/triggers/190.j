
//===========================================================================
// Trigger: 未命名触发器 190
//===========================================================================
function Trig_190_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(PLAYER_NEUTRAL_AGGRESSIVE) ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_190_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( ( "|cffff0303" + ( ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + GetUnitName(GetDyingUnit()) ) ) + "被中立生物杀死了！难道他想给中立生物练级吗？" ) ) + "|r " ) )
endfunction

//===========================================================================
function InitTrig_190 takes nothing returns nothing
    set gg_trg_190 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_190, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_190, Condition( function Trig_190_Conditions ) )
    call TriggerAddAction( gg_trg_190, function Trig_190_Actions )
endfunction
