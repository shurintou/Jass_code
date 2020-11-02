
//===========================================================================
// Trigger: 未命名触发器 121
//===========================================================================
function Trig_121_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_121_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3148" )
endfunction

//===========================================================================
function InitTrig_121 takes nothing returns nothing
    set gg_trg_121 = CreateTrigger(  )
    call TriggerRegisterPlayerUnitEventSimple( gg_trg_121, Player(10), EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_121, Condition( function Trig_121_Conditions ) )
    call TriggerAddAction( gg_trg_121, function Trig_121_Actions )
endfunction
