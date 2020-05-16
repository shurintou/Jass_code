
//===========================================================================
// Trigger: 未命名触发器 141
//===========================================================================
function Trig_141_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_141_Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(5) ) ) then
        return false
    endif
    return true
endfunction

function Trig_141_Actions takes nothing returns nothing
    if ( Trig_141_Func001C() ) then
        call TriggerSleepAction( ( I2R(GetUnitLevel(GetDyingUnit())) * 2.00 ) )
        call ReviveHeroLoc( GetTriggerUnit(), GetRectCenter(gg_rct_024), true )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cfffeba0e" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( ( "的" + GetUnitName(GetDyingUnit()) ) + ( "复活了！！" + "|r" ) ) ) ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_141 takes nothing returns nothing
    set gg_trg_141 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_141, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_141, Condition( function Trig_141_Conditions ) )
    call TriggerAddAction( gg_trg_141, function Trig_141_Actions )
endfunction
