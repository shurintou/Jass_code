
//===========================================================================
// Trigger: TCA
//===========================================================================
function Trig_TCA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    local real ds1=GetUnitDefaultMoveSpeed(u)
    local real ds2=GetUnitDefaultMoveSpeed(t)
    local real s1=(GetUnitMoveSpeed(u)-ds1)/ds1
    local real s2=(ds2-GetUnitMoveSpeed(t))/ds2
    
    if s1>0 then
        call SetUnitState( u, UNIT_STATE_LIFE,0.5*(GetUnitState(u, UNIT_STATE_LIFE)*(1-s1))+(GetUnitState(u, UNIT_STATE_MAX_LIFE)*s1))
    endif
    if s2>0 then
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\TCattackdown.mdx", t, "chest") )
        call UnitDamageTarget( u, t, 0.1*s2*GetUnitState(t, UNIT_STATE_MAX_LIFE) , true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
    endif
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueImmediateOrderById(u, 852183 )
    else
    endif
    call IssueImmediateOrderById(u, 852096 )
    call IssueImmediateOrderById( u, 852285 )
    call SetUnitAbilityLevel( u, 'A08S', i )
    call SetUnitAbilityLevel( u, 'A09B', i )
    call SetUnitAbilityLevel( u, 'A08T', i )
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_TCA takes nothing returns nothing
    set gg_trg_TCA = CreateTrigger(  )
    call DisableTrigger( gg_trg_TCA )
    call TriggerAddCondition( gg_trg_TCA, Condition( function Trig_TCA_Conditions ) )
endfunction
