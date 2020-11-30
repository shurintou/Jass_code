
//===========================================================================
// Trigger: 未命名触发器 271
//===========================================================================
function Trig_271_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(3) ) ) then
        return false
    endif
    return true
endfunction

function Trig_271_Actions takes nothing returns nothing
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 5, I2S(GetPlayerScore(Player(3), PLAYER_SCORE_UNITS_KILLED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 4, 5, I2S(GetPlayerState(Player(3), PLAYER_STATE_RESOURCE_FOOD_USED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 5, I2S(GetPlayerScore(Player(3), PLAYER_SCORE_HEROES_KILLED)) )
endfunction

//===========================================================================
function InitTrig_271 takes nothing returns nothing
    set gg_trg_271 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_271, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_271, Condition( function Trig_271_Conditions ) )
    call TriggerAddAction( gg_trg_271, function Trig_271_Actions )
endfunction
