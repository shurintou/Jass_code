
//===========================================================================
// Trigger: 未命名触发器 273
//===========================================================================
function Trig_273_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(4) ) ) then
        return false
    endif
    return true
endfunction

function Trig_273_Actions takes nothing returns nothing
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 6, I2S(GetPlayerScore(Player(4), PLAYER_SCORE_UNITS_KILLED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 6, I2S(GetPlayerScore(Player(4), PLAYER_SCORE_HEROES_KILLED)) )
endfunction

//===========================================================================
function InitTrig_273 takes nothing returns nothing
    set gg_trg_273 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_273, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_273, Condition( function Trig_273_Conditions ) )
    call TriggerAddAction( gg_trg_273, function Trig_273_Actions )
endfunction
