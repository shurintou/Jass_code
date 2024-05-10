
//===========================================================================
// Trigger: attackbycaptain
//===========================================================================
function Trig_attackbycaptain_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local real x
    local real y
    
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true then
        set x=GetUnitX(t)
        set y=GetUnitY(t)
        call IssuePointOrderById( u, 852504, x, y )
        call IssuePointOrderById( u, 852232, x, y )
    endif
    
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_attackbycaptain takes nothing returns nothing
    set gg_trg_attackbycaptain = CreateTrigger(  )
    call DisableTrigger(gg_trg_attackbycaptain)
    call TriggerAddCondition( gg_trg_attackbycaptain, Condition( function Trig_attackbycaptain_Conditions ) )
    
endfunction
