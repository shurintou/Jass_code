
//===========================================================================
// Trigger: XINGharmed
//
// 
//  
//===========================================================================
function Trig_XINGharmed_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real r=GetUnitState(u, UNIT_STATE_LIFE)
    local real h=GetEventDamage()
    local real a
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    local real mr=GetUnitState(u, UNIT_STATE_MAX_LIFE)
    
    if  r/mr<0.5 then
        call IssueImmediateOrderById(  u, 852184 )
    endif
    set a=h/r
    if a>0.7 then
        set a=0.75*h
    elseif a>0.3 then
        set a=0.55*h
    elseif a>0.1 then
        set a=0.35*h
    else
        set a=0.15*h
    endif
    call SetUnitState( u, UNIT_STATE_LIFE, r+a)
    
    set h=udg_UGharm[i]+a
    if h>mr then
        set udg_UGharm[i]=mr
    else
        set udg_UGharm[i]=h
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_XINGharmed takes nothing returns nothing
    set gg_trg_XINGharmed = CreateTrigger(  )
    call DisableTrigger( gg_trg_XINGharmed )
    call TriggerAddCondition( gg_trg_XINGharmed, Condition( function Trig_XINGharmed_Conditions ) )
endfunction
