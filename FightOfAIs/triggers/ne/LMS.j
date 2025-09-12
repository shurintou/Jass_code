
//===========================================================================
// Trigger: LMS
//===========================================================================
function LM1 takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LM1.mdx", t, "origin") )
        call UnitDamageTarget( udg_U, t, udg_Re*(1-(0.5*Sin(GetUnitFacing(t)*bj_DEGTORAD))), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
            if GetUnitAbilityLevel(t,'A08R')>0 then
                call UnitDamageTarget( udg_U, t, udg_UGharm[udg_n]*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
                call UnitRemoveAbility(t,'A08R')
                call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LMEMP.mdx", t, "origin") )
            else
                call UnitAddAbility(t,'A08R')
            endif
        endif
    endif
    set t=null
    return false
endfunction

function LMDA takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        call UnitDamageTarget( udg_U, t, udg_Re, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
            if GetUnitAbilityLevel(t,'A08R')>0 then
                call UnitDamageTarget( udg_U, t, udg_UGharm[udg_n]*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
                call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LMEMP.mdx", t, "origin") )
            else
                call UnitAddAbility(t,'A08R')
            endif
        endif
    endif
    set t=null
    return false
endfunction

function Trig_LMS_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local boolexpr b
    local integer level=GetHeroLevel(u)
    local unit t
    
    if  l == 'A08O'  then
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re=200+(10*level)
        set udg_n=GetConvertedPlayerId(udg_P)
        set udg_UGharm[udg_n]=(level/500)+0.02
        set b=Condition(function  LM1)
        call GroupEnumUnitsInRange(udg_NullGroup,GetSpellTargetX(),GetSpellTargetY(),450,b)
        call DestroyBoolExpr(b)
    elseif l=='A08P' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set udg_P=GetOwningPlayer(u)
            set udg_U=u
            set udg_n=GetConvertedPlayerId(udg_P)
            set udg_UGharm[udg_n]=(level/500)+0.02
            set udg_Re=20*level+(GetHeroInt(u,true)*(6+(4*GetUnitAbilityLevel(u,'B01T'))))
            set b=Condition(function  LMDA)
            call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(t),GetUnitY(t),GetHeroAgi(u,true)+20+level,b)
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\Bolt\\BoltImpact.mdl", t, "origin") )
            call DestroyBoolExpr(b)
        endif
    elseif l=='A08V' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LMda.mdx", t, "origin") )
            call UnitDamageTarget( u, t, 60+(3*level), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            if GetUnitAbilityLevel(t,'A08R')>0 then
                call UnitDamageTarget( u, t, ((level/500)+0.02)*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
                call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LMEMP.mdx", t, "origin") )
            else
                call UnitAddAbility(t,'A08R')
            endif
        endif
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    set u=null
    set t=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_LMS takes nothing returns nothing
    set gg_trg_LMS = CreateTrigger(  )
    call DisableTrigger( gg_trg_LMS )
    call TriggerAddCondition( gg_trg_LMS, Condition( function Trig_LMS_Conditions ) )
    
endfunction
