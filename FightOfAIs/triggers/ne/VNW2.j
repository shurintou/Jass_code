
//===========================================================================
// Trigger: VNW2
//===========================================================================
function Trig_VNW2_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    
    local real r= GetUnitState(u, UNIT_STATE_MANA)
    local real h=GetEventDamage()
    local real hp=GetUnitState(u, UNIT_STATE_LIFE)
    
    if r >= 100 and h>20 then
        call SetUnitState( u, UNIT_STATE_MANA, r-(0.05*GetUnitState(u, UNIT_STATE_MAX_MANA)) )
        call SetUnitState( u, UNIT_STATE_LIFE, hp + 0.95*h )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\SpellShieldAmulet\\SpellShieldCaster.mdl", u, "chest") )
    endif
    if hp/GetUnitState(u, UNIT_STATE_MAX_LIFE) <0.5 or r<100 then
        call IssueImmediateOrderById( u, 852183 )
    endif
    set u=null
    
    return false
endfunction




//===========================================================================
function InitTrig_VNW2 takes nothing returns nothing
    set gg_trg_VNW2 = CreateTrigger(  )
    call DisableTrigger(gg_trg_VNW2)
    call TriggerAddCondition( gg_trg_VNW2, Condition( function Trig_VNW2_Conditions ) )
    
endfunction
