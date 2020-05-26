
//===========================================================================
// Trigger: 未命名触发器 275
//===========================================================================
function Trig_275_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(6) ) ) then
        return false
    endif
    return true
endfunction

function Trig_275_Actions takes nothing returns nothing
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 8, I2S(GetPlayerScore(Player(6), PLAYER_SCORE_UNITS_KILLED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 8, I2S(GetPlayerScore(Player(6), PLAYER_SCORE_HEROES_KILLED)) )
endfunction

//===========================================================================
function InitTrig_275 takes nothing returns nothing
    set gg_trg_275 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_275, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_275, Condition( function Trig_275_Conditions ) )
    call TriggerAddAction( gg_trg_275, function Trig_275_Actions )
endfunction
