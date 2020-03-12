
//===========================================================================
// Trigger: 未命名触发器 294
//===========================================================================
function Trig_294_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == false ) ) then
        return false
    endif
    if ( not ( IsUnitAlly(GetKillingUnitBJ(), GetOwningPlayer(GetDyingUnit())) == true ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(4) ) ) then
        return false
    endif
    return true
endfunction

function Trig_294_Func001C takes nothing returns boolean
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_294_Actions takes nothing returns nothing
    if ( Trig_294_Func001C() ) then
        call AdjustPlayerStateBJ( 1, GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_FOOD_USED )
        call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 4, 6, I2S(GetPlayerState(Player(4), PLAYER_STATE_RESOURCE_FOOD_USED)) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff1ce6b9" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "反补了一座塔！" + "|r " ) ) ) )
    else
        call AdjustPlayerStateBJ( 1, GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_FOOD_USED )
        call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 4, 6, I2S(GetPlayerState(Player(4), PLAYER_STATE_RESOURCE_FOOD_USED)) )
    endif
endfunction

//===========================================================================
function InitTrig_294 takes nothing returns nothing
    set gg_trg_294 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_294, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_294, Condition( function Trig_294_Conditions ) )
    call TriggerAddAction( gg_trg_294, function Trig_294_Actions )
endfunction
