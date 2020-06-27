
//===========================================================================
// Trigger: 未命名触发器 193
//===========================================================================
function Trig_193_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(PLAYER_NEUTRAL_AGGRESSIVE) ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(3) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_193_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( ( "|cff540081" + ( ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + GetUnitName(GetDyingUnit()) ) ) + "被中立生物杀死了！难道他想给中立生物练级吗？" ) ) + "|r " ) )
endfunction

//===========================================================================
function InitTrig_193 takes nothing returns nothing
    set gg_trg_193 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_193, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_193, Condition( function Trig_193_Conditions ) )
    call TriggerAddAction( gg_trg_193, function Trig_193_Actions )
endfunction
