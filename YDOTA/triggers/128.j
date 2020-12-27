
//===========================================================================
// Trigger: 未命名触发器 128
//===========================================================================
function Trig_128_Func017C takes nothing returns boolean
    if ( ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_FLYING) == true ) ) then
        return true
    endif
    if ( ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_GROUND) == true ) ) then
        return true
    endif
    if ( ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_SUMMONED) == true ) ) then
        return true
    endif
    if ( ( IsUnitIllusionBJ(GetKillingUnitBJ()) == true ) ) then
        return true
    endif
    if ( ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_HERO) == true ) ) then
        return true
    endif
    return false
endfunction

function Trig_128_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(4) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not Trig_128_Func017C() ) then
        return false
    endif
    return true
endfunction

function Trig_128_Func009C takes nothing returns boolean
    if ( not ( IsUnitAlly(GetDyingUnit(), Player(0)) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_128_Func010C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(9) ) ) then
        return false
    endif
    return true
endfunction

function Trig_128_Func011C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(8) ) ) then
        return false
    endif
    return true
endfunction

function Trig_128_Func012C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(7) ) ) then
        return false
    endif
    return true
endfunction

function Trig_128_Func013C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(6) ) ) then
        return false
    endif
    return true
endfunction

function Trig_128_Func014C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(5) ) ) then
        return false
    endif
    return true
endfunction

function Trig_128_Actions takes nothing returns nothing
    set udg_wanjia6siwang = ( "|cfffeba0e" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_beifangdaole = ( "|cff4c2a04" + ( ( "被放倒了，他将在" + ( I2S(( GetUnitLevel(GetDyingUnit()) * 2 )) + "秒后复活。|r" ) ) + "|r" ) )
    set udg_wanjia7siwang = ( "|cff20c000" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia8siwang = ( "|cffd55bb0" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia9siwang = ( "|cff959697" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia10siwang = ( "|cff7ebff1" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia555555xiongshou = ( "|c00fffc01" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "的" + ( GetUnitName(GetKillingUnitBJ()) + "|r" ) ) ) )
    set udg_shasile = ( "|cff106246" + ( "杀死了" + "|r" ) )
    if ( Trig_128_Func009C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|c00fffc01" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + "杀死了自己的队友！|r" ) ) )
    else
    endif
    if ( Trig_128_Func010C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia555555xiongshou + ( udg_shasile + udg_wanjia10siwang ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia10siwang + udg_beifangdaole ) )
    else
    endif
    if ( Trig_128_Func011C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia555555xiongshou + ( udg_shasile + udg_wanjia9siwang ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia9siwang + udg_beifangdaole ) )
    else
    endif
    if ( Trig_128_Func012C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia555555xiongshou + ( udg_shasile + udg_wanjia8siwang ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia8siwang + udg_beifangdaole ) )
    else
    endif
    if ( Trig_128_Func013C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia555555xiongshou + ( udg_shasile + udg_wanjia7siwang ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia7siwang + udg_beifangdaole ) )
    else
    endif
    if ( Trig_128_Func014C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia555555xiongshou + ( udg_shasile + udg_wanjia6siwang ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia6siwang + udg_beifangdaole ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_128 takes nothing returns nothing
    set gg_trg_128 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_128, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_128, Condition( function Trig_128_Conditions ) )
    call TriggerAddAction( gg_trg_128, function Trig_128_Actions )
endfunction
