
//===========================================================================
// Trigger: SPA
//===========================================================================
function Trig_SPA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=R2I((GetHeroLevel(u)-2)/8)
    local player p=GetTriggerPlayer()
    local real r=GetUnitState(u, UNIT_STATE_LIFE)
    local real mr=GetUnitState(u, UNIT_STATE_MAX_LIFE)
    if IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById(u, 852662, t)
    endif
    call SetUnitAbilityLevel(u,'A097',i)
    call SetUnitAbilityLevel(u,'ANsy',i)
    call SetUnitAbilityLevel(u,'A093',i)
    call SetUnitAbilityLevel(u,'A094',i)
    call SetUnitState( u, UNIT_STATE_LIFE,r+((100+(50*i))*(mr-r)/mr))
    if GetPlayerTechCountSimple('R00B', p)!=i then
        call SetPlayerTechResearched(p, 'R00B', i)
    endif
    set r=GetUnitX(t)
    set mr=GetUnitY(t)
    call IssuePointOrderById(u, 852664, r, mr )
    call IssuePointOrderById(u, 852089, r, mr )
    call IssuePointOrderById(u, 852658, GetUnitX(u),GetUnitY(u) )
    call UnitDamageTarget( u, t, (0.02+(0.02*i))*(GetUnitState(t, UNIT_STATE_MAX_LIFE)-GetUnitState(t, UNIT_STATE_LIFE)) , true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
    set u=null
    set t=null
    set p=null
    return false
endfunction

//===========================================================================
function InitTrig_SPA takes nothing returns nothing
    set gg_trg_SPA = CreateTrigger(  )
    call DisableTrigger( gg_trg_SPA )
    call TriggerAddCondition( gg_trg_SPA, Condition( function Trig_SPA_Conditions ) )
endfunction
