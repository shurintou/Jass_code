
//===========================================================================
// Trigger: 未命名触发器 242
//===========================================================================
function Trig_242_Func001C takes nothing returns boolean
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

function Trig_242_Conditions takes nothing returns boolean
    if ( not Trig_242_Func001C() ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) != Player(10) ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) != Player(11) ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) != Player(PLAYER_NEUTRAL_AGGRESSIVE) ) ) then
        return false
    endif
    if ( not ( IsUnitAlly(GetDyingUnit(), GetOwningPlayer(GetKillingUnitBJ())) == false ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_STRUCTURE) == false ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_242_Actions takes nothing returns nothing
    call PlaySoundBJ( gg_snd_firstblood )
    call AdjustPlayerStateBJ( 250, GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_GOLD )
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cffff0303" + ( ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + "获得了第一滴血！！" ) + "|r" ) ) )
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|c00fffc01" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "获得了250黄金。" + "|r" ) ) ) )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_242 takes nothing returns nothing
    set gg_trg_242 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_242, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_242, Condition( function Trig_242_Conditions ) )
    call TriggerAddAction( gg_trg_242, function Trig_242_Actions )
endfunction
