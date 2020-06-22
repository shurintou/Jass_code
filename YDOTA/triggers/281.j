
//===========================================================================
// Trigger: 未命名触发器 281
//===========================================================================
function Trig_281_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(9) ) ) then
        return false
    endif
    return true
endfunction

function Trig_281_Actions takes nothing returns nothing
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 11, I2S(GetPlayerScore(Player(9), PLAYER_SCORE_UNITS_KILLED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 11, I2S(GetPlayerScore(Player(9), PLAYER_SCORE_HEROES_KILLED)) )
endfunction

//===========================================================================
function InitTrig_281 takes nothing returns nothing
    set gg_trg_281 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_281, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_281, Condition( function Trig_281_Conditions ) )
    call TriggerAddAction( gg_trg_281, function Trig_281_Actions )
endfunction
