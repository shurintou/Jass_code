
//===========================================================================
// Trigger: 未命名触发器 240
//===========================================================================
function Trig_240_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'N00G' ) ) then
        return false
    endif
    if ( not ( GetSpellAbilityId() == 'A028' ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) == Player(9) ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Func002C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) == Player(8) ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Func003C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) == Player(7) ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Func004C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) == Player(6) ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Func005C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) == Player(5) ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Func006C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) == Player(4) ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Func007C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) == Player(3) ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Func008C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) == Player(2) ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Func009C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) == Player(1) ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Func010C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetSpellAbilityUnit()) == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_240_Actions takes nothing returns nothing
    if ( Trig_240_Func001C() ) then
        call TriggerSleepAction( 0.50 )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff7ebff1" + ( "炸弹超人自杀了！！" + "|r " ) ) )
    else
    endif
    if ( Trig_240_Func002C() ) then
        call TriggerSleepAction( 0.50 )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff959697" + ( "炸弹超人自杀了！！" + "|r " ) ) )
    else
    endif
    if ( Trig_240_Func003C() ) then
        call TriggerSleepAction( 0.50 )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cffd55bb0" + ( "炸弹超人自杀了！！" + "|r " ) ) )
    else
    endif
    if ( Trig_240_Func004C() ) then
        call TriggerSleepAction( 0.50 )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff20c000" + ( "炸弹超人自杀了！！" + "|r " ) ) )
    else
    endif
    if ( Trig_240_Func005C() ) then
        call TriggerSleepAction( 0.50 )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cfffeba0e" + ( "炸弹超人自杀了！！" + "|r " ) ) )
    else
    endif
    if ( Trig_240_Func006C() ) then
        call TriggerSleepAction( 0.50 )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|c00fffc01" + ( "炸弹超人自杀了！！" + "|r " ) ) )
    else
    endif
    if ( Trig_240_Func007C() ) then
        call TriggerSleepAction( 0.50 )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff540081" + ( "炸弹超人自杀了！！" + "|r " ) ) )
    else
    endif
    if ( Trig_240_Func008C() ) then
        call TriggerSleepAction( 0.50 )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff1ce6b9" + ( "炸弹超人自杀了！！" + "|r " ) ) )
    else
    endif
    if ( Trig_240_Func009C() ) then
        call TriggerSleepAction( 0.50 )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff0042ff" + ( "炸弹超人自杀了！！" + "|r " ) ) )
    else
    endif
    if ( Trig_240_Func010C() ) then
        call TriggerSleepAction( 0.50 )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cffff0303" + ( "炸弹超人自杀了！！" + "|r " ) ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_240 takes nothing returns nothing
    set gg_trg_240 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_240, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_240, Condition( function Trig_240_Conditions ) )
    call TriggerAddAction( gg_trg_240, function Trig_240_Actions )
endfunction
