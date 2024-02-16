
//===========================================================================
// Trigger: guerdant
//===========================================================================
function Trig_guerdant_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local real x
    local real y
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    if IsUnitType(t, UNIT_TYPE_HERO) == true then
        set x=GetUnitX(t)
        set y= GetUnitY(t)
        call IssuePointOrderById( u, 852504, x, y )
        call IssuePointOrderById(u, 852597, x,y )
    endif
    call IssueTargetOrderById( u, 852095, t )
    call SetUnitAbilityLevel( u, 'A01Q', i )
    call SetUnitAbilityLevel( u, 'A01R', i )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_guerdant takes nothing returns nothing
    set gg_trg_guerdant = CreateTrigger(  )
    call DisableTrigger(gg_trg_guerdant)
    call TriggerAddCondition( gg_trg_guerdant, Condition( function Trig_guerdant_Conditions ) )
    
endfunction
