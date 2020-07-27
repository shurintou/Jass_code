
//===========================================================================
// Trigger: 未命名触发器 122
//===========================================================================
function Trig_122_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_122_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3149" )
endfunction

//===========================================================================
function InitTrig_122 takes nothing returns nothing
    set gg_trg_122 = CreateTrigger(  )
    call TriggerRegisterPlayerUnitEventSimple( gg_trg_122, Player(11), EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_122, Condition( function Trig_122_Conditions ) )
    call TriggerAddAction( gg_trg_122, function Trig_122_Actions )
endfunction
