
//===========================================================================
// Trigger: 未命名触发器 129
//===========================================================================
function Trig_129_Func025C takes nothing returns boolean
    if ( ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_FLYING) == true ) ) then
        return true
    endif
    if ( ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_GROUND) == true ) ) then
        return true
    endif
    if ( ( IsUnitIllusionBJ(GetKillingUnitBJ()) == true ) ) then
        return true
    endif
    if ( ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_SUMMONED) == true ) ) then
        return true
    endif
    if ( ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_HERO) == true ) ) then
        return true
    endif
    return false
endfunction

function Trig_129_Conditions takes nothing returns boolean
    if ( not ( IsPlayerAlly(GetOwningPlayer(GetKillingUnitBJ()), GetOwningPlayer(GetDyingUnit())) == true ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not Trig_129_Func025C() ) then
        return false
    endif
    return true
endfunction

function Trig_129_Func013C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(4) ) ) then
        return false
    endif
    return true
endfunction

function Trig_129_Func014C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(5) ) ) then
        return false
    endif
    return true
endfunction

function Trig_129_Func015C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(6) ) ) then
        return false
    endif
    return true
endfunction

function Trig_129_Func016C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(7) ) ) then
        return false
    endif
    return true
endfunction

function Trig_129_Func017C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(8) ) ) then
        return false
    endif
    return true
endfunction

function Trig_129_Func018C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(9) ) ) then
        return false
    endif
    return true
endfunction

function Trig_129_Func019C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(3) ) ) then
        return false
    endif
    return true
endfunction

function Trig_129_Func020C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(2) ) ) then
        return false
    endif
    return true
endfunction

function Trig_129_Func021C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(1) ) ) then
        return false
    endif
    return true
endfunction

function Trig_129_Func023C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_129_Actions takes nothing returns nothing
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
    set udg_beimengyoushasi1111 = ( "|cff106246被队友杀死了，他将在" + ( ( I2S(( GetUnitLevel(GetDyingUnit()) * 2 )) + "秒后复活！" ) + "|r" ) )
    set udg_beizhanyoushale222222 = ( "|cff4c2a04被队友杀死了，他将在" + ( ( I2S(( GetUnitLevel(GetDyingUnit()) * 2 )) + "秒后复活！" ) + "|r" ) )
    if ( Trig_129_Func013C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia5siwang + udg_beimengyoushasi1111 ) )
    else
    endif
    if ( Trig_129_Func014C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia6siwang + udg_beizhanyoushale222222 ) )
    else
    endif
    if ( Trig_129_Func015C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia7siwang + udg_beizhanyoushale222222 ) )
    else
    endif
    if ( Trig_129_Func016C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia8siwang + udg_beizhanyoushale222222 ) )
    else
    endif
    if ( Trig_129_Func017C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia9siwang + udg_beizhanyoushale222222 ) )
    else
    endif
    if ( Trig_129_Func018C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia10siwang + udg_beizhanyoushale222222 ) )
    else
    endif
    if ( Trig_129_Func019C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia4siwang + udg_beimengyoushasi1111 ) )
    else
    endif
    if ( Trig_129_Func020C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia3siwang + udg_beimengyoushasi1111 ) )
    else
    endif
    if ( Trig_129_Func021C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia2siwang + udg_beimengyoushasi1111 ) )
    else
    endif
    if ( Trig_129_Func023C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia1siwang + udg_beimengyoushasi1111 ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_129 takes nothing returns nothing
    set gg_trg_129 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_129, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_129, Condition( function Trig_129_Conditions ) )
    call TriggerAddAction( gg_trg_129, function Trig_129_Actions )
endfunction
