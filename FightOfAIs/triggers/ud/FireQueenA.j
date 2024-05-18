
//===========================================================================
// Trigger: FireQueenA
//===========================================================================
function Trig_FireQueenA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local real x=GetUnitX(t)
    local real y=GetUnitY(t)
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    call IssuePointOrderById( u, 852560, x, y )
    call IssuePointOrderById( u, 852125, x, y )
    if GetUnitAbilityLevel(u,'A04M')>0 then
        call SetUnitAbilityLevel(u,'A04M',R2I((GetHeroLevel(u)-3)/7)+GetUnitAbilityLevel(u,'B01T'))
    endif
    if  IsUnitType(t, UNIT_TYPE_HERO) == true then
        if GetUnitDefaultFlyHeight(u) < 300 then
            call IssueImmediateOrderById( u, 852180 )
        endif
    endif
    set u=null
    set t=null
    return false
endfunction


//===========================================================================
function InitTrig_FireQueenA takes nothing returns nothing
    set gg_trg_FireQueenA = CreateTrigger(  )
    call DisableTrigger( gg_trg_FireQueenA )
    call TriggerAddCondition( gg_trg_FireQueenA, Condition( function Trig_FireQueenA_Conditions ) )
endfunction
