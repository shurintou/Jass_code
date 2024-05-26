
//===========================================================================
// Trigger: DOA
//===========================================================================
function Trig_DOA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer level=R2I((GetHeroLevel(u)-5)/7)
    local integer i = GetConvertedPlayerId( GetTriggerPlayer() )
    local integer n
    
    set udg_Chaoxi[i] = udg_Chaoxi[i] + level
    call SetUnitAbilityLevel(u,'A0AI',level)
    call SetUnitAbilityLevel(u,'A0AR',level)
    call SetUnitAbilityLevel(u,'A0AJ',level+GetUnitAbilityLevel(u,'B01T'))
    call IssueImmediateOrderById( u,852096 )
    call IssueImmediateOrderById( u,852127 )
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        set udg_Chaoxi[i] = udg_Chaoxi[i] + level
        call IssueTargetOrderById( u,852662, t)
        set n = GetUnitAbilityLevel(u,'A03B')
        if t != udg_SpellTarget[i] then
            call SetUnitAbilityLevel(u,'A03B',1)
            call UnitAddAbility(t,'A0AM')
            call SetUnitAbilityLevel(t,'A0AM',2)
            call UnitRemoveAbility(t,'A0AM')
            call UnitAddAbility(udg_SpellTarget[i],'A0AL')
            call SetUnitAbilityLevel(udg_SpellTarget[i],'A0AL',1 + n)
            call UnitRemoveAbility(udg_SpellTarget[i],'A0AL')
            set udg_SpellTarget[i] = t
            call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Undead\\UndeadBlood\\UndeadBloodAbomination.mdl", t, "chest") )
        else
            if n < 4 then
                call SetUnitAbilityLevel(u,'A03B',n + 1)
                call UnitAddAbility(t,'A0AM')
                call SetUnitAbilityLevel(t,'A0AM',2)
                call UnitRemoveAbility(t,'A0AM')
                call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Undead\\UndeadBlood\\UndeadBloodAbomination.mdl", t, "chest") )
            endif
            
        endif

    endif
   
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_DOA takes nothing returns nothing
    set gg_trg_DOA = CreateTrigger(  )
    call DisableTrigger( gg_trg_DOA )
    call TriggerAddCondition( gg_trg_DOA, Condition( function Trig_DOA_Conditions ) )
endfunction
