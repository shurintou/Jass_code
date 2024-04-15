
//===========================================================================
// Trigger: LAA
//===========================================================================
function Trig_LAA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=GetHeroLevel(u)
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local integer l
    
    call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LA3effect.mdx", t, "chest") )
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    set l=R2I((i-5)/5)
    call IssuePointOrderById(u, 852057, GetUnitX(t), GetUnitY(t) )
    call SetUnitAbilityLevel(u,'A08J',l)
    call SetUnitAbilityLevel(u,'A08K',l)
    call SetUnitAbilityLevel(u,'A08L',l)
    call SetUnitAbilityLevel(u,'A08M',l)
    call SetUnitAbilityLevel(u,'A08I',l)
    
    
    
    if GetUnitAbilityLevel(u,'B01Z')>0 then
        set l=GetUnitAbilityLevel(u,'A087')+1
        set i=4+R2I(i/5)
        if l>i then
            call SetUnitAbilityLevel(u,'A087',i)
        else
            call SetUnitAbilityLevel(u,'A087',l)
        endif
    else
        call SetUnitAbilityLevel(u,'A087',1)
    endif
    
    call UnitAddAbility(u,'A08F')
    call UnitRemoveAbility(u,'A08F')
    
    
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_LAA takes nothing returns nothing
    set gg_trg_LAA = CreateTrigger(  )
    call DisableTrigger( gg_trg_LAA )
    call TriggerAddCondition( gg_trg_LAA, Condition( function Trig_LAA_Conditions ) )
    
endfunction
