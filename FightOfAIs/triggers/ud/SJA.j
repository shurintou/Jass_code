
//===========================================================================
// Trigger: SJA
//
//  
//===========================================================================
function Trig_SJA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer l=R2I((GetHeroLevel(u)-4)/6)
    local real r=GetUnitState(t, UNIT_STATE_MAX_LIFE)*0.01*(l+GetUnitAbilityLevel(t,'A07C')+GetUnitAbilityLevel(t,'B018'))
    local real h=GetUnitState(u, UNIT_STATE_LIFE)
    call SetUnitAbilityLevel(u,'A07A',l)
    call SetUnitAbilityLevel(u,'A07B',l)
    call SetUnitAbilityLevel(u,'A07D',l+GetUnitAbilityLevel(u,'B01T'))
    call UnitDamageTarget( u, t, r, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
    call SetUnitState( u, UNIT_STATE_LIFE,h+((1-(h/GetUnitState(u, UNIT_STATE_MAX_LIFE)))*r))
    if  IsUnitType(t, UNIT_TYPE_HERO) == true and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false then
        call IssueImmediateOrderById(  u, 852096 )
        call IssueImmediateOrderById( u, 852183 )
        call IssuePointOrderById( u, 852125, GetUnitX(t), GetUnitY(t) )
    endif
    set u=null
    set t=null
    return false
endfunction


//===========================================================================
function InitTrig_SJA takes nothing returns nothing
    set gg_trg_SJA = CreateTrigger(  )
    call DisableTrigger( gg_trg_SJA )
    call TriggerAddCondition( gg_trg_SJA, Condition( function Trig_SJA_Conditions ) )
endfunction
