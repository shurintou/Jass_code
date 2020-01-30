
//===========================================================================
// Trigger: 未命名触发器 279
//===========================================================================
function Trig_279_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(8) ) ) then
        return false
    endif
    return true
endfunction

function Trig_279_Actions takes nothing returns nothing
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 10, I2S(GetPlayerScore(Player(8), PLAYER_SCORE_UNITS_KILLED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 10, I2S(GetPlayerScore(Player(8), PLAYER_SCORE_HEROES_KILLED)) )
endfunction

//===========================================================================
function InitTrig_279 takes nothing returns nothing
    set gg_trg_279 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_279, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_279, Condition( function Trig_279_Conditions ) )
    call TriggerAddAction( gg_trg_279, function Trig_279_Actions )
endfunction
