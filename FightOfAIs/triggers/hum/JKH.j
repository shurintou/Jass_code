
//===========================================================================
// Trigger: JKH
//===========================================================================
function Trig_JKH_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    local unit t=GetEventDamageSource()
    if GetUnitAbilityLevel(t ,'B00J')>0 or GetUnitAbilityLevel(t, 'Aloc') >0 or IsUnitType(t, UNIT_TYPE_STRUCTURE) == true then
    else
        call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+GetEventDamage() )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl", u, "chest") )
    endif
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852095, t )
    endif
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_JKH takes nothing returns nothing
    set gg_trg_JKH = CreateTrigger(  )
    call DisableTrigger( gg_trg_JKH )
    call TriggerAddCondition( gg_trg_JKH, Condition( function Trig_JKH_Conditions ) )
endfunction
