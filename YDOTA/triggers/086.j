
//===========================================================================
// Trigger: 未命名触发器 086
//===========================================================================
function Trig_086_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(5) ) ) then
        return false
    endif
    return true
endfunction

function Trig_086_Actions takes nothing returns nothing
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 7, I2S(GetPlayerScore(Player(5), PLAYER_SCORE_UNITS_KILLED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 7, I2S(GetPlayerScore(Player(5), PLAYER_SCORE_HEROES_KILLED)) )
endfunction

//===========================================================================
function InitTrig_086 takes nothing returns nothing
    set gg_trg_086 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_086, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_086, Condition( function Trig_086_Conditions ) )
    call TriggerAddAction( gg_trg_086, function Trig_086_Actions )
endfunction
