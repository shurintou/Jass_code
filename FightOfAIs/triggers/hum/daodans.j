
//===========================================================================
// Trigger: daodans
//===========================================================================
function Trig_daodans_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call IssuePointOrderById( u, 852658, GetUnitX(t), GetUnitY(t))
    call IssuePointOrderById(u , 852652, GetUnitX(t), GetUnitY(t) )
    call IssueImmediateOrderById( u, 852183 )
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    call SetUnitAbilityLevel(u, 'ANd3', R2I((GetHeroLevel(u)-4)/6) )
    call SetUnitAbilityLevel(u, 'A02H', R2I((GetHeroLevel(u)-5)/5)+GetUnitAbilityLevel(u,'B01T') )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_daodans takes nothing returns nothing
    set gg_trg_daodans = CreateTrigger(  )
    call DisableTrigger(gg_trg_daodans)
    call TriggerAddCondition( gg_trg_daodans, Condition( function Trig_daodans_Conditions ) )
    
endfunction
