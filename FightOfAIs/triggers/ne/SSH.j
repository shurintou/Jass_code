
//===========================================================================
// Trigger: SSH
//===========================================================================
function Trig_SSH_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer ui=GetUnitTypeId(u)
    local real r=GetEventDamage()
    local unit t=GetEventDamageSource()
    
    if IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u,852095, t)
    endif
    
    if ui=='H00B' and IsUnitType(t, UNIT_TYPE_MELEE_ATTACKER) == true then
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE) + 0.6*r)
        set u=null
        set t=null
        return false
    elseif ui=='H00C' and IsUnitType(t, UNIT_TYPE_RANGED_ATTACKER) == true then
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE) + 0.6*r)
        set u=null
        set t=null
        return false
    elseif ui=='H00D' then
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE) + 0.2*r)
        set u=null
        set t=null
        return false
    endif
    
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_SSH takes nothing returns nothing
    set gg_trg_SSH = CreateTrigger(  )
    call DisableTrigger( gg_trg_SSH )
    call TriggerAddCondition( gg_trg_SSH, Condition( function Trig_SSH_Conditions ) )
endfunction
