
//===========================================================================
// Trigger: 未命名触发器 136
//===========================================================================
function Trig_136_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_136_Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_136_Actions takes nothing returns nothing
    if ( Trig_136_Func001C() ) then
        call TriggerSleepAction( ( I2R(GetUnitLevel(GetDyingUnit())) * 2.00 ) )
        call ReviveHeroLoc( GetTriggerUnit(), GetRectCenter(gg_rct_hero), true )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cffff0303" + ( GetPlayerName(GetOwningPlayer(GetDyingUnit())) + ( ( "的" + GetUnitName(GetDyingUnit()) ) + ( "复活了！！" + "|r" ) ) ) ) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_136 takes nothing returns nothing
    set gg_trg_136 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_136, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_136, Condition( function Trig_136_Conditions ) )
    call TriggerAddAction( gg_trg_136, function Trig_136_Actions )
endfunction
