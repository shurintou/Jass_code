
//===========================================================================
// Trigger: 未命名触发器 249
//===========================================================================
function Trig_249_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_249_Actions takes nothing returns nothing
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 2, I2S(GetPlayerScore(Player(0), PLAYER_SCORE_UNITS_KILLED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 2, I2S(GetPlayerScore(Player(0), PLAYER_SCORE_HEROES_KILLED)) )
endfunction

//===========================================================================
function InitTrig_249 takes nothing returns nothing
    set gg_trg_249 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_249, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_249, Condition( function Trig_249_Conditions ) )
    call TriggerAddAction( gg_trg_249, function Trig_249_Actions )
endfunction
