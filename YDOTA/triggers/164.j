
//===========================================================================
// Trigger: 未命名触发器 164
//===========================================================================
function Trig_164_Conditions takes nothing returns boolean
    if ( not ( IsUnitEnemy(GetDyingUnit(), GetOwningPlayer(GetKillingUnitBJ())) == true ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_164_Func001Func007C takes nothing returns boolean
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(5) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(6) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(7) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(8) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(9) ) ) then
        return true
    endif
    return false
endfunction

function Trig_164_Func001C takes nothing returns boolean
    if ( not Trig_164_Func001Func007C() ) then
        return false
    endif
    return true
endfunction

function Trig_164_Func003Func007C takes nothing returns boolean
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(0) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(1) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(2) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(3) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(4) ) ) then
        return true
    endif
    return false
endfunction

function Trig_164_Func003C takes nothing returns boolean
    if ( not Trig_164_Func003Func007C() ) then
        return false
    endif
    return true
endfunction

function Trig_164_Actions takes nothing returns nothing
    if ( Trig_164_Func001C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_6359" )
        call AdjustPlayerStateBJ( 150, Player(5), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 150, Player(6), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 150, Player(7), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 150, Player(9), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 150, Player(8), PLAYER_STATE_RESOURCE_GOLD )
    else
    endif
    if ( Trig_164_Func003C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_6358" )
        call AdjustPlayerStateBJ( 150, Player(0), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 150, Player(1), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 150, Player(3), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 150, Player(2), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 150, Player(4), PLAYER_STATE_RESOURCE_GOLD )
    else
    endif
endfunction

//===========================================================================
function InitTrig_164 takes nothing returns nothing
    set gg_trg_164 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_164, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_164, Condition( function Trig_164_Conditions ) )
    call TriggerAddAction( gg_trg_164, function Trig_164_Actions )
endfunction
