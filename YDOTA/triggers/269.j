
//===========================================================================
// Trigger: 未命名触发器 269
//===========================================================================
function Trig_269_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(2) ) ) then
        return false
    endif
    return true
endfunction

function Trig_269_Actions takes nothing returns nothing
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 4, I2S(GetPlayerScore(Player(2), PLAYER_SCORE_UNITS_KILLED)) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 4, I2S(GetPlayerScore(Player(2), PLAYER_SCORE_HEROES_KILLED)) )
endfunction

//===========================================================================
function InitTrig_269 takes nothing returns nothing
    set gg_trg_269 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_269, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_269, Condition( function Trig_269_Conditions ) )
    call TriggerAddAction( gg_trg_269, function Trig_269_Actions )
endfunction
