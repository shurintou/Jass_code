
//===========================================================================
// Trigger: 未命名触发器 061
//===========================================================================
function Trig_061_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetBuyingUnit()) == 'ewsp' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetSoldItem()) == 'I00J' ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Func008C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetBuyingUnit()) == Player(9) ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Func009C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetBuyingUnit()) == Player(8) ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Func010C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetBuyingUnit()) == Player(7) ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Func011C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetBuyingUnit()) == Player(6) ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Func012C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetBuyingUnit()) == Player(5) ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Func013C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetBuyingUnit()) == Player(4) ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Func014C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetBuyingUnit()) == Player(3) ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Func015C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetBuyingUnit()) == Player(2) ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Func016C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetBuyingUnit()) == Player(1) ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Func017C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetBuyingUnit()) == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_061_Actions takes nothing returns nothing
    call ReplaceUnitBJ( GetBuyingUnit(), 'N00G', bj_UNIT_STATE_METHOD_DEFAULTS )
    call SetUnitPositionLoc( GetLastReplacedUnitBJ(), GetPlayerStartLocationLoc(GetOwningPlayer(GetBuyingUnit())) )
    call UnitAddItemByIdSwapped( 'I01A', GetLastReplacedUnitBJ() )
    call KillUnit( GetBuyingUnit() )
    call RemoveItemFromStockBJ( GetItemTypeId(GetSoldItem()), GetSellingUnit() )
    call DisableTrigger( GetTriggeringTrigger() )
    call RemoveItemFromStockBJ( GetItemTypeId(GetSoldItem()), gg_unit_n000_0029 )
    if ( Trig_061_Func008C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff7ebff1" + ( GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + ( "购买了" + ( GetUnitName(GetLastReplacedUnitBJ()) + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_061_Func009C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff959697" + ( GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + ( "购买了" + ( GetUnitName(GetLastReplacedUnitBJ()) + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_061_Func010C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cffd55bb0" + ( GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + ( "购买了" + ( GetUnitName(GetLastReplacedUnitBJ()) + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_061_Func011C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff20c000" + ( GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + ( "购买了" + ( GetUnitName(GetLastReplacedUnitBJ()) + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_061_Func012C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cfffeba0e" + ( GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + ( "购买了" + ( GetUnitName(GetLastReplacedUnitBJ()) + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_061_Func013C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|c00fffc01" + ( GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + ( "购买了" + ( GetUnitName(GetLastReplacedUnitBJ()) + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_061_Func014C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff540081" + ( GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + ( "购买了" + ( GetUnitName(GetLastReplacedUnitBJ()) + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_061_Func015C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff1ce6b9" + ( GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + ( "购买了" + ( GetUnitName(GetLastReplacedUnitBJ()) + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_061_Func016C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff0042ff" + ( GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + ( "购买了" + ( GetUnitName(GetLastReplacedUnitBJ()) + "|r" ) ) ) ) )
    else
    endif
    if ( Trig_061_Func017C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cffff0303" + ( GetPlayerName(GetOwningPlayer(GetBuyingUnit())) + ( "购买了" + ( GetUnitName(GetLastReplacedUnitBJ()) + "|r" ) ) ) ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_061 takes nothing returns nothing
    set gg_trg_061 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_061, gg_unit_n000_0029, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_061, Condition( function Trig_061_Conditions ) )
    call TriggerAddAction( gg_trg_061, function Trig_061_Actions )
endfunction
