
//===========================================================================
// Trigger: 未命名触发器 138
//===========================================================================
function Trig_138_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_138_Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(2) ) ) then
        return false
    endif
    return true
endfunction

function Trig_138_Actions takes nothing returns nothing
    if ( Trig_138_Func001C() ) then
        call TriggerSleepAction( ( I2R(GetUnitLevel(GetDyingUnit())) * 2.00 ) )
        call ReviveHeroLoc( GetTriggerUnit(), GetRectCenter(gg_rct_hero), true )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff1ce6b9" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( ( "的" + GetUnitName(GetDyingUnit()) ) + ( "复活了！！" + "|r" ) ) ) ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_138 takes nothing returns nothing
    set gg_trg_138 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_138, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_138, Condition( function Trig_138_Conditions ) )
    call TriggerAddAction( gg_trg_138, function Trig_138_Actions )
endfunction
