
//===========================================================================
// Trigger: pitlord
//===========================================================================
function Trig_pitlord_Conditions takes nothing returns boolean
    local unit t=GetAttacker()
    local unit u= GetTriggerUnit()
    if  GetUnitAbilityLevel(t, 'BNht') ==0  then
        call IssueImmediateOrderById(u, 852588 )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Cleave\\CleaveDamageTarget.mdl", t, "chest") )
        if IsUnitType(t, UNIT_TYPE_HERO) == true then
            call UnitDamageTarget( u, t, 0.15*GetHeroStr(u, true), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        else
            call UnitDamageTarget( u, t, 0.1*GetHeroStr(u, true), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
    else
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Cleave\\CleaveDamageTarget.mdl", t, "chest") )
        if IsUnitType(t, UNIT_TYPE_HERO) == true then
            call UnitDamageTarget( u, t, 0.4*GetHeroStr(u, true), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        else
            call UnitDamageTarget( u, t, 0.2*GetHeroStr(u, true), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
    endif
    
    if  GetUnitAbilityLevel(t, 'BNdo') >0  then
        call UnitDamageTarget( u, t, GetHeroStr(u, true), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_pitlord takes nothing returns nothing
    set gg_trg_pitlord = CreateTrigger(  )
    call DisableTrigger( gg_trg_pitlord)
    call TriggerAddCondition( gg_trg_pitlord, Condition( function Trig_pitlord_Conditions ) )
    
endfunction
