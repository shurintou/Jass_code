
//===========================================================================
// Trigger: shouwangH
//===========================================================================
function Trig_shouwangH_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    local real h=GetEventDamage()
    
    if h>0 then
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+(0.75*h) )
    else
        call DisableTrigger(gg_trg_shouwangH)
        call UnitDamageTarget( GetEventDamageSource(), u, -h*2.25, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
        call EnableTrigger(gg_trg_shouwangH)
    endif
    
    set u=null
    return false
    
endfunction



//===========================================================================
function InitTrig_shouwangH takes nothing returns nothing
    set gg_trg_shouwangH = CreateTrigger(  )
    call DisableTrigger( gg_trg_shouwangH )
    call TriggerAddCondition( gg_trg_shouwangH, Condition( function Trig_shouwangH_Conditions ) )
endfunction
