
//===========================================================================
// Trigger: 未命名触发器 131
//===========================================================================
function Trig_131_Func017C takes nothing returns boolean
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

function Trig_131_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(6) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not Trig_131_Func017C() ) then
        return false
    endif
    return true
endfunction

function Trig_131_Func009C takes nothing returns boolean
    if ( not ( IsUnitAlly(GetDyingUnit(), Player(5)) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_131_Func010C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_131_Func011C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(1) ) ) then
        return false
    endif
    return true
endfunction

function Trig_131_Func012C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(2) ) ) then
        return false
    endif
    return true
endfunction

function Trig_131_Func013C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(4) ) ) then
        return false
    endif
    return true
endfunction

function Trig_131_Func014C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetDyingUnit()) == Player(3) ) ) then
        return false
    endif
    return true
endfunction

function Trig_131_Actions takes nothing returns nothing
    set udg_shasile = ( "|cff4c2a04" + ( "杀死了" + "|r" ) )
    set udg_wanjia777777xiongshou = ( "|cff20c000" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + ( "的" + ( GetUnitName(GetKillingUnitBJ()) + "|r" ) ) ) )
    set udg_beifangdaole2 = ( "|cff106246" + ( ( "被放倒了，他将在" + ( I2S(( GetUnitLevel(GetDyingUnit()) * 2 )) + "秒后复活。|r" ) ) + "|r" ) )
    set udg_wanjia1siwang = ( "|cffff0303" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia2siwang = ( "|cff0042ff" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia3siwang = ( "|cff1ce6b9" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia4siwang = ( "|cff540081" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    set udg_wanjia5siwang = ( "|c00fffc01" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( "的" + ( GetUnitName(GetDyingUnit()) + "|r" ) ) ) )
    if ( Trig_131_Func009C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff20c000" + ( GetPlayerName(GetOwningPlayer(GetKillingUnitBJ())) + "杀死了自己的队友！|r" ) ) )
    else
    endif
    if ( Trig_131_Func010C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia777777xiongshou + ( udg_shasile + udg_wanjia1siwang ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia1siwang + udg_beifangdaole2 ) )
    else
    endif
    if ( Trig_131_Func011C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia777777xiongshou + ( udg_shasile + udg_wanjia2siwang ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia2siwang + udg_beifangdaole2 ) )
    else
    endif
    if ( Trig_131_Func012C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia777777xiongshou + ( udg_shasile + udg_wanjia3siwang ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia3siwang + udg_beifangdaole2 ) )
    else
    endif
    if ( Trig_131_Func013C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia777777xiongshou + ( udg_shasile + udg_wanjia5siwang ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia5siwang + udg_beifangdaole2 ) )
    else
    endif
    if ( Trig_131_Func014C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia777777xiongshou + ( udg_shasile + udg_wanjia4siwang ) ) )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( udg_wanjia4siwang + udg_beifangdaole2 ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_131 takes nothing returns nothing
    set gg_trg_131 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_131, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_131, Condition( function Trig_131_Conditions ) )
    call TriggerAddAction( gg_trg_131, function Trig_131_Actions )
endfunction
