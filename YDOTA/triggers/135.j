
//===========================================================================
// Trigger: 未命名触发器 135
//===========================================================================
function Trig_135_Func021001 takes nothing returns boolean
    return ( GetOwningPlayer(GetKillingUnitBJ()) == Player(10) )
endfunction

function Trig_135_Func021002 takes nothing returns boolean
    return ( GetOwningPlayer(GetKillingUnitBJ()) == Player(11) )
endfunction

function Trig_135_Conditions takes nothing returns boolean
    if ( not GetBooleanOr( Trig_135_Func021001(), Trig_135_Func021002() ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Func011C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Func012C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(1) ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Func013C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(2) ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Func014C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(3) ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Func015C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(4) ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Func016C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(5) ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Func017C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(6) ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Func018C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(7) ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Func019C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(8) ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Func020C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(9) ) ) then
        return false
    endif
    return true
endfunction

function Trig_135_Actions takes nothing returns nothing
    set udg_wanjia1siwang = ( "|cffff0303" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia2siwang = ( "|cff0042ff" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia3siwang = ( "|cff1ce6b9" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia4siwang = ( "|cff540081" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia5siwang = ( "|c00fffc01" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia6siwang = ( "|cfffeba0e" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia7siwang = ( "|cff20c000" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia8siwang = ( "|cffd55bb0" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia9siwang = ( "|cff959697" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia10siwang = ( "|cff7ebff1" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    if ( Trig_135_Func011C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia1siwang + ( ( "|cffff0303" + "死于非命了！" ) + "|r " ) ) )
    else
    endif
    if ( Trig_135_Func012C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia2siwang + ( ( "|cff0042ff" + "死于非命了！" ) + "|r " ) ) )
    else
    endif
    if ( Trig_135_Func013C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia3siwang + ( ( "|cff1ce6b9" + "死于非命了！" ) + "|r " ) ) )
    else
    endif
    if ( Trig_135_Func014C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia4siwang + ( ( "|cff540081" + "死于非命了！" ) + "|r " ) ) )
    else
    endif
    if ( Trig_135_Func015C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia5siwang + ( ( "|c00fffc01" + "死于非命了！" ) + "|r " ) ) )
    else
    endif
    if ( Trig_135_Func016C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia6siwang + ( ( "|cfffeba0e" + "死于非命了！" ) + "|r " ) ) )
    else
    endif
    if ( Trig_135_Func017C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia7siwang + ( ( "|cff20c000" + "死于非命了！" ) + "|r " ) ) )
    else
    endif
    if ( Trig_135_Func018C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia8siwang + ( ( "|cffd55bb0" + "死于非命了！" ) + "|r " ) ) )
    else
    endif
    if ( Trig_135_Func019C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia9siwang + ( ( "|cff959697" + "死于非命了！" ) + "|r " ) ) )
    else
    endif
    if ( Trig_135_Func020C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia10siwang + ( ( "|cff7ebff1" + "死于非命了！" ) + "|r " ) ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_135 takes nothing returns nothing
    set gg_trg_135 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_135, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_135, Condition( function Trig_135_Conditions ) )
    call TriggerAddAction( gg_trg_135, function Trig_135_Actions )
endfunction
