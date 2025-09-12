
//===========================================================================
// Trigger: nageshield
//===========================================================================
function Trig_nageshield_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local real h=GetEventDamage()
    local real hp=GetUnitState(u, UNIT_STATE_LIFE)
    local real hm=GetUnitState(u, UNIT_STATE_MAX_LIFE)
    local real dh=hm-hp
    if h>dh then
        set h=dh/3
        if r>h then
            call SetUnitState( u, UNIT_STATE_LIFE, hm )
            call SetUnitState( u, UNIT_STATE_MANA, r-h )
        else
            call SetUnitState( u, UNIT_STATE_MANA, 0)
            call SetUnitState( u, UNIT_STATE_LIFE, hp+r*3 )
        endif
    else
        set dh=h/3
        if r>dh then
            call SetUnitState( u, UNIT_STATE_MANA, r-dh )
            call SetUnitState( u, UNIT_STATE_LIFE, hp+h )
        else
            call SetUnitState( u, UNIT_STATE_MANA, 0)
            call SetUnitState( u, UNIT_STATE_LIFE, hp+r*3 )
        endif
    endif
    set u=null
    
    return false
    
endfunction



//===========================================================================
function InitTrig_nageshield takes nothing returns nothing
    set gg_trg_nageshield = CreateTrigger(  )
    call DisableTrigger(gg_trg_nageshield)
    call TriggerAddCondition( gg_trg_nageshield, Condition( function Trig_nageshield_Conditions ) )
    
endfunction
