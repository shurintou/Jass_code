
//===========================================================================
// Trigger: DAA
//===========================================================================
function Trig_DAA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=GetHeroLevel(u)
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local integer l
    local real x=GetUnitX(t)
    local real y=GetUnitY(t)
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\DA2point.mdx", t, "overhead") )
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852095, t )
        call IssuePointOrderById( u, 852089, x,y )
    endif
    call IssuePointOrderById(u, 852232, x,y  )
    set i=R2I((i-4)/6)
    call SetUnitAbilityLevel(u,'A088',i)
    call SetUnitAbilityLevel(u,'A089',i)
    call SetUnitAbilityLevel(u,'A08A',i)
    call UnitRemoveAbility(u,'Bams')
    call UnitRemoveAbility(u,'Bam2')
    set l=i+GetUnitAbilityLevel(t,'B00V')+GetUnitAbilityLevel(t,'B01X')+GetUnitAbilityLevel(t,'A08E')
    if l>i then
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\IceVolcanoMissile.mdx", t, "chest") )
        call UnitDamageTarget( u, t, (l*50)+25, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    endif
    
    set t=null
    set u=null
    return false
endfunction


//===========================================================================
function InitTrig_DAA takes nothing returns nothing
    set gg_trg_DAA = CreateTrigger(  )
    call DisableTrigger( gg_trg_DAA )
    call TriggerAddCondition( gg_trg_DAA, Condition( function Trig_DAA_Conditions ) )
endfunction
