
//===========================================================================
// Trigger: 未命名触发器 264
//===========================================================================
function Trig_264_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(4) ) ) then
        return false
    endif
    if ( not ( IsUnitAlly(GetDyingUnit(), GetOwningPlayer(GetKillingUnitBJ())) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_264_Func007C takes nothing returns boolean
    if ( not ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_STRUCTURE) == false ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_LUMBER) >= 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_264_Func008C takes nothing returns boolean
    if ( not ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_STRUCTURE) == false ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_LUMBER) == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_264_Func009C takes nothing returns boolean
    if ( not ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_STRUCTURE) == false ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_LUMBER) == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_264_Func010C takes nothing returns boolean
    if ( not ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_STRUCTURE) == false ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_LUMBER) == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_264_Func011C takes nothing returns boolean
    if ( not ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_STRUCTURE) == false ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_LUMBER) == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_264_Actions takes nothing returns nothing
    call EnableTrigger( gg_trg_274 )
    call AdjustPlayerStateBJ( 1, GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_LUMBER )
    if ( Trig_264_Func007C() ) then
        call AdjustPlayerStateBJ( 100, GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_GOLD )
        call PlaySoundBJ( gg_snd_Ownage )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff0042ff" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "|cffff0303完成了群杀！！|r " + "|r" ) ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff20c000" + ( "奖励" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "  |c00fffc01100黄金！！|r" + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_264_Func008C() ) then
        call AdjustPlayerStateBJ( 50, GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_GOLD )
        call PlaySoundBJ( gg_snd_Ownage )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff0042ff" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "|cffff0303完成了群杀！！|r " + "|r" ) ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff20c000" + ( "奖励" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "  |c00fffc0150黄金！！|r" + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_264_Func009C() ) then
        call AdjustPlayerStateBJ( 50, GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_GOLD )
        call PlaySoundBJ( gg_snd_triple_kill )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff0042ff" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "|cffff0303完成了四杀！！|r " + "|r" ) ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff20c000" + ( "奖励" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "  |c00fffc0150黄金！！|r" + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_264_Func010C() ) then
        call AdjustPlayerStateBJ( 50, GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_GOLD )
        call PlaySoundBJ( gg_snd_Double_Kill )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff0042ff" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "|cff20c000完成了双杀！！|r " + "|r" ) ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff20c000" + ( "奖励" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "  |c00fffc0150黄金！！|r" + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_264_Func011C() ) then
        call AdjustPlayerStateBJ( 50, GetOwningPlayer(GetKillingUnitBJ()), PLAYER_STATE_RESOURCE_GOLD )
        call PlaySoundBJ( gg_snd_triple_kill )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff0042ff" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "|cffff0303完成了三杀！！|r " + "|r" ) ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff20c000" + ( "奖励" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "  |c00fffc0150黄金！！|r" + "|r" ) ) ) ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_264 takes nothing returns nothing
    set gg_trg_264 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_264, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_264, Condition( function Trig_264_Conditions ) )
    call TriggerAddAction( gg_trg_264, function Trig_264_Actions )
endfunction
