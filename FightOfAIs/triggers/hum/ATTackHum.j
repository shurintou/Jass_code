
//===========================================================================
// Trigger: ATTackHum
//
// NEmage is also using this trigger.
//===========================================================================
function Trig_ATTackHum_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local unit t=GetEventTargetUnit()
    local integer i=GetUnitTypeId(u)
    
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    if i=='Hamg' then
        call IssuePointOrderById( u, 852089, GetUnitX(t)+GetRandomReal(-50,50),GetUnitY(t)+GetRandomReal(-50,50) )
    endif
    
    set u=null
    set t=null
    
    return false
endfunction



//===========================================================================
function InitTrig_ATTackHum takes nothing returns nothing
    set gg_trg_ATTackHum = CreateTrigger(  )
    call DisableTrigger( gg_trg_ATTackHum )
    call TriggerAddCondition( gg_trg_ATTackHum, Condition( function Trig_ATTackHum_Conditions ) )
endfunction
