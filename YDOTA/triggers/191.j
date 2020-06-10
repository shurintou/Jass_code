
//===========================================================================
// Trigger: 未命名触发器 191
//===========================================================================
function Trig_191_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(PLAYER_NEUTRAL_AGGRESSIVE) ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(1) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_191_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( ( "|cff0042ff" + ( ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + GetUnitName(GetDyingUnit()) ) ) + "被中立生物杀死了！难道他想给中立生物练级吗？" ) ) + "|r " ) )
endfunction

//===========================================================================
function InitTrig_191 takes nothing returns nothing
    set gg_trg_191 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_191, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_191, Condition( function Trig_191_Conditions ) )
    call TriggerAddAction( gg_trg_191, function Trig_191_Actions )
endfunction
