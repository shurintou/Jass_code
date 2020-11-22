
//===========================================================================
// Trigger: 未命名触发器 142
//===========================================================================
function Trig_142_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_142_Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(6) ) ) then
        return false
    endif
    return true
endfunction

function Trig_142_Actions takes nothing returns nothing
    if ( Trig_142_Func001C() ) then
        call TriggerSleepAction( ( I2R(GetUnitLevel(GetDyingUnit())) * 2.00 ) )
        call ReviveHeroLoc( GetTriggerUnit(), GetRectCenter(gg_rct_024), true )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff20c000" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( ( "的" + GetUnitName(GetDyingUnit()) ) + ( "复活了！！" + "|r" ) ) ) ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_142 takes nothing returns nothing
    set gg_trg_142 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_142, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_142, Condition( function Trig_142_Conditions ) )
    call TriggerAddAction( gg_trg_142, function Trig_142_Actions )
endfunction
