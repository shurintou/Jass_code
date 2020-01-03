
//===========================================================================
// Trigger: 未命名触发器 143
//===========================================================================
function Trig_143_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_143_Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(7) ) ) then
        return false
    endif
    return true
endfunction

function Trig_143_Actions takes nothing returns nothing
    if ( Trig_143_Func001C() ) then
        call TriggerSleepAction( ( I2R(GetUnitLevel(GetDyingUnit())) * 2.00 ) )
        call ReviveHeroLoc( GetTriggerUnit(), GetRectCenter(gg_rct_024), true )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cffd55bb0" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( ( "的" + GetUnitName(GetDyingUnit()) ) + ( "复活了！！" + "|r" ) ) ) ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_143 takes nothing returns nothing
    set gg_trg_143 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_143, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_143, Condition( function Trig_143_Conditions ) )
    call TriggerAddAction( gg_trg_143, function Trig_143_Actions )
endfunction
