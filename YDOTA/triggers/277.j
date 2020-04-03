
//===========================================================================
// Trigger: 未命名触发器 277
//===========================================================================
function Trig_277_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(7) ) ) then
        return false
    endif
    return true
endfunction

function Trig_277_Actions takes nothing returns nothing
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 9, I2S(GetPlayerScore(Player(7), PLAYER_SCORE_UNITS_KILLED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 9, I2S(GetPlayerScore(Player(7), PLAYER_SCORE_HEROES_KILLED)) )
endfunction

//===========================================================================
function InitTrig_277 takes nothing returns nothing
    set gg_trg_277 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_277, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_277, Condition( function Trig_277_Conditions ) )
    call TriggerAddAction( gg_trg_277, function Trig_277_Actions )
endfunction
