
//===========================================================================
// Trigger: SSA
//===========================================================================
function Trig_SSA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=R2I((GetHeroLevel(u)-7)/6)
    local integer ui=GetUnitTypeId(u)
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    call SetUnitAbilityLevel(u,'A0A1',i)
    call SetUnitAbilityLevel(u,'A0A4',i)
    call SetUnitAbilityLevel(u,'A0A6',i)
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        if ui=='H00B' and IsUnitType(t, UNIT_TYPE_MELEE_ATTACKER) == true then
            call UnitDamageTarget( u, t, 0.04+0.004*(i+ udg_Chaoxi[n] + 8*GetUnitAbilityLevel(u,'B01T'))*GetUnitState(u, UNIT_STATE_MAX_LIFE), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
        elseif ui=='H00C' and IsUnitType(t, UNIT_TYPE_RANGED_ATTACKER) == true then
            call UnitDamageTarget( u, t, 0.04+0.004*(i+ udg_Chaoxi[n] + 8*GetUnitAbilityLevel(u,'B01T'))*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
    endif
    if IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueImmediateOrderById( u,852127 )
        call IssueImmediateOrderById( u,852183 )
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_SSA takes nothing returns nothing
    set gg_trg_SSA = CreateTrigger(  )
    call DisableTrigger( gg_trg_SSA )
    call TriggerAddCondition( gg_trg_SSA, Condition( function Trig_SSA_Conditions ) )
endfunction
