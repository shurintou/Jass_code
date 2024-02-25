
//===========================================================================
// Trigger: novaasdasd
//===========================================================================
function Trig_novaasdasd_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local real x
    local real y
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    call SetUnitAbilityLevel(u,'A021',i)
    call SetUnitAbilityLevel(u,'A023',i)
    call SetUnitAbilityLevel(u,'A01Y',i)
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        set x=GetUnitX(t)
        set y=GetUnitY(t)
        call IssuePointOrderById( u, 852597, x+GetRandomReal(-150,150), y+GetRandomReal(-150,150) )
        call IssuePointOrderById( u, 852089, x, y )
        call IssueTargetOrderById( u, 852095, t )
    endif
    
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_novaasdasd takes nothing returns nothing
    set gg_trg_novaasdasd = CreateTrigger(  )
    call DisableTrigger(gg_trg_novaasdasd)
    call TriggerAddCondition( gg_trg_novaasdasd, Condition( function Trig_novaasdasd_Conditions ) )
endfunction
