
//===========================================================================
// Trigger: AMA
//===========================================================================
function Trig_AMA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real r=0.97*GetUnitState(u, UNIT_STATE_MANA)
    local unit t=GetEventTargetUnit()
    if IsUnitType(t, UNIT_TYPE_HERO) == true then
        call IssueTargetOrderById( u, 852662, t )
        call IssueTargetOrderById( u, 852095, t )
    endif
    if  GetUnitAbilityLevel(t,'B01I')>0 then
    else
        call UnitAddAbility(t,'A049')
        call UnitRemoveAbility(t,'A049')
    endif
    call SetUnitState( u, UNIT_STATE_MANA,r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    set u=null
    set t=null
    return false
endfunction


//===========================================================================
function InitTrig_AMA takes nothing returns nothing
    set gg_trg_AMA = CreateTrigger(  )
    call DisableTrigger( gg_trg_AMA )
    call TriggerAddCondition( gg_trg_AMA, Condition( function Trig_AMA_Conditions ) )
endfunction
