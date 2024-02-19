
//===========================================================================
// Trigger: FTD
//===========================================================================
function Trig_FTD_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    
    if udg_Chaoxi[i]>0 then
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+GetEventDamage())
        set udg_Chaoxi[i]=udg_Chaoxi[i]-1
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl", u, "origin") )
        if udg_Chaoxi[i]==0 then
            call UnitRemoveAbility(u,'A06D')
        endif
    else
        call IssueImmediateOrderById(u, 852184 )
    endif
    if IsUnitType(GetEventDamageSource() , UNIT_TYPE_HERO) == true then
        call IssueImmediateOrderById(u, 852183 )
        call IssueImmediateOrderById(u, 852127 )
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_FTD takes nothing returns nothing
    set gg_trg_FTD = CreateTrigger(  )
    call DisableTrigger( gg_trg_FTD )
    call TriggerAddCondition( gg_trg_FTD, Condition( function Trig_FTD_Conditions ) )
endfunction
