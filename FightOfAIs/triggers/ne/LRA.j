
//===========================================================================
// Trigger: LRA
//===========================================================================
function Trig_LRA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local real l
    local integer i=GetHeroLevel(u)
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852095, t )
    endif
    if GetUnitState(u, UNIT_STATE_LIFE)/GetUnitState(u, UNIT_STATE_MAX_LIFE)<0.6 then
        call IssueImmediateOrderById( u, 852183 )
    endif
    call IssueImmediateOrderById( u, 852621 )
    if GetRandomInt(1,60)<i then
        if GetUnitAbilityLevel(u,'A05T')>0 then
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\lr5.mdx", t, "chest") )
            set l=GetHeroLevel(u)*0.004*(GetUnitState(t, UNIT_STATE_MAX_LIFE)-GetUnitState(t, UNIT_STATE_LIFE))
            call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+(0.5*l)+(0.05*(GetUnitState(u, UNIT_STATE_MAX_LIFE)-GetUnitState(u, UNIT_STATE_LIFE))))
            call UnitDamageTarget( u, t, l, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        else
            set l=GetHeroLevel(u)*0.002*(GetUnitState(t, UNIT_STATE_MAX_LIFE)-GetUnitState(t, UNIT_STATE_LIFE))
            call UnitDamageTarget( u, t, l, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\wolf.mdx", t, "chest") )
        endif
    endif
    call SetUnitAbilityLevel( u, 'A05W', R2I((i-5)/5) )
    call SetUnitAbilityLevel( u, 'A05V', R2I((i-3)/7)+GetUnitAbilityLevel(u,'B01T') )
    call SetUnitAbilityLevel( u, 'A05Z', R2I((i-5)/5) )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_LRA takes nothing returns nothing
    set gg_trg_LRA = CreateTrigger(  )
    call DisableTrigger( gg_trg_LRA )
    call TriggerAddCondition( gg_trg_LRA, Condition( function Trig_LRA_Conditions ) )
endfunction
