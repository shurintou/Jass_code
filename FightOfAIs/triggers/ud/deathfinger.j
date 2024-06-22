
//===========================================================================
// Trigger: deathfinger
//===========================================================================
function Trig_deathfinger_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local real x=GetUnitX(t)
    local real y= GetUnitY(t)
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call IssuePointOrderById( u, 852229,x,y )
    call IssuePointOrderById(u, 852089, x, y )
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true and  IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false then
        call SetUnitAbilityLevel( u, 'A05K', i )
        call SetUnitAbilityLevel( u, 'ANdp', i )
        call SetUnitAbilityLevel( u, 'A09Q', i )
        call SetUnitAbilityLevel( u, 'A00C', i )
        call IssuePointOrderById( u, 852232, x,y )
        call IssueTargetOrderById( u, 852230, t )
    endif
    
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_deathfinger takes nothing returns nothing
    set gg_trg_deathfinger = CreateTrigger(  )
    call DisableTrigger( gg_trg_deathfinger)
    call TriggerAddCondition( gg_trg_deathfinger, Condition( function Trig_deathfinger_Conditions ) )
    
endfunction
