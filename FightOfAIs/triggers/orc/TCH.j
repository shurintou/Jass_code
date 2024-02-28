
//===========================================================================
// Trigger: TCH
//===========================================================================
function Trig_TCH_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    local real g=GetUnitMoveSpeed(GetEventDamageSource())
    local real r=0
    if g<=10 then
        set g= 261
    endif
    set r=(GetUnitMoveSpeed(u)-g)
    if r>0 then
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+(r/600*GetEventDamage() ) )
    else
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+(r/1500*GetEventDamage() ) )
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_TCH takes nothing returns nothing
    set gg_trg_TCH = CreateTrigger(  )
    call DisableTrigger( gg_trg_TCH )
    call TriggerAddCondition( gg_trg_TCH, Condition( function Trig_TCH_Conditions ) )
endfunction
