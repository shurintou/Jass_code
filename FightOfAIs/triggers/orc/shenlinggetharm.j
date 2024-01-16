
//===========================================================================
// Trigger: shenlinggetharm
//===========================================================================
function Trig_shenlinggetharm_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    
    local real h=GetUnitState(u, UNIT_STATE_LIFE)*100
    local real mh=GetUnitState(u, UNIT_STATE_MAX_LIFE)
    local integer prhp=R2I(h/mh)
    local integer i=R2I((100-prhp)/7)*4
    
    
    call SetUnitAbilityLevel( u, 'A02P', i )
    call SetUnitAbilityLevel( u, 'A02O', i )
    
    
    if prhp<70 then
        call IssueTargetOrderById( u, 852160, u )
    endif
    
    if prhp<50 then
        call UnitAddAbility(u,'A00J')
        call UnitRemoveAbility(u,'AEpa')
    else
        call UnitRemoveAbility(u,'A00J')
        call UnitAddAbility(u,'AEpa')
        call IssueImmediateOrderById( u, 852255 )
        call SetUnitAbilityLevel( u, 'AEpa', R2I((GetHeroLevel(u)-5)/5) )
    endif
    
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_shenlinggetharm takes nothing returns nothing
    set gg_trg_shenlinggetharm = CreateTrigger(  )
    call DisableTrigger( gg_trg_shenlinggetharm )
    call TriggerAddCondition( gg_trg_shenlinggetharm, Condition( function Trig_shenlinggetharm_Conditions ) )
endfunction
