
//===========================================================================
// Trigger: TTA
//===========================================================================
function Trig_TTA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer l=R2I((GetHeroLevel(u)-3)/7)
    if t==udg_SpellTarget[GetConvertedPlayerId(GetTriggerPlayer())] then
        call UnitDamageTarget( u, t, (l*10)+30, true, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
    else
        call UnitDamageTarget( u, t, (l*10)+30, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
    endif
    call SetUnitAbilityLevel(u,'A08Z',l)
    call SetUnitAbilityLevel(u,'A090',l)
    call SetUnitAbilityLevel(u,'A091',l)
    call IssueImmediateOrderById(u, 852184 )
    call IssueTargetOrderById(u, 852095,t)
    if IsUnitType(t, UNIT_TYPE_HERO) == true then
        call IssueImmediateOrderById(u, 852183 )
    endif
    set u=null
    set t=null
    return false
endfunction


//===========================================================================
function InitTrig_TTA takes nothing returns nothing
    set gg_trg_TTA = CreateTrigger(  )
    call DisableTrigger( gg_trg_TTA )
    call TriggerAddCondition( gg_trg_TTA, Condition( function Trig_TTA_Conditions ) )
endfunction
