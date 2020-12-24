
//===========================================================================
// Trigger: 未命名触发器 259
//===========================================================================
function Trig_259_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(1) ) ) then
        return false
    endif
    return true
endfunction

function Trig_259_Actions takes nothing returns nothing
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 3, I2S(GetPlayerScore(Player(1), PLAYER_SCORE_UNITS_KILLED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 4, 3, I2S(GetPlayerState(Player(1), PLAYER_STATE_RESOURCE_FOOD_USED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 3, I2S(GetPlayerScore(Player(1), PLAYER_SCORE_HEROES_KILLED)) )
endfunction

//===========================================================================
function InitTrig_259 takes nothing returns nothing
    set gg_trg_259 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_259, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_259, Condition( function Trig_259_Conditions ) )
    call TriggerAddAction( gg_trg_259, function Trig_259_Actions )
endfunction
