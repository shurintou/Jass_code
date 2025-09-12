
//===========================================================================
// Trigger: LMA
//===========================================================================
function Trig_LMA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    local real dx=GetUnitX(t)
    local real dy=GetUnitY(t)
    local real x=GetUnitX(u)-dx
    local real y=GetUnitY(u)-dy
    local real r=(x*x)+(y*y)
    local unit m
    
    call SetUnitAbilityLevel(u,'A08O',i)
    call SetUnitAbilityLevel(u,'A08P',i)
    call SetUnitAbilityLevel(u,'A08V',i)
    call IssuePointOrderById( u, 852089, dx,dy )
    call UnitDamageTarget( u, t, GetHeroLevel(u)*0.00002*r, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852095, t )
        call IssueTargetOrderById(u, 852230,t )
        if GetUnitAbilityLevel(t,'A08R')>0 then
            call UnitDamageTarget( u, t, ((i*0.02)+0.02)*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call UnitRemoveAbility(t,'A08R')
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LMEMP.mdx", t, "origin") )
        endif
    endif
    set r=GetUnitState(u, UNIT_STATE_MANA)
    if GetRandomReal(0,0.75)>GetUnitState(u, UNIT_STATE_LIFE)/GetUnitState(u, UNIT_STATE_MAX_LIFE) and r>50*i then
        call SetUnitState( u, UNIT_STATE_MANA, r-(50*i))
        set m=CreateUnit(getcorrectplayer(u) ,'u00E',GetUnitX(u)+GetRandomReal(-100,100),GetUnitY(u)+GetRandomReal(-100,100),0)
        call UnitRemoveAbility(m,'Aloc')
        call UnitRemoveAbility(m,'Avul')
        call UnitAddAbility(m,'A08Q')
        call SetUnitAbilityLevel(m,'A08Q',i)
        call IssueTargetOrderById(m, 852487,u)
        call UnitApplyTimedLife( m, 'BTLF', 3 )
    endif
    set u=null
    set t=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_LMA takes nothing returns nothing
    set gg_trg_LMA = CreateTrigger(  )
    call DisableTrigger( gg_trg_LMA )
    call TriggerAddCondition( gg_trg_LMA, Condition( function Trig_LMA_Conditions ) )
    
endfunction
