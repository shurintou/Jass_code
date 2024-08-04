
//===========================================================================
// Trigger: magicshield
//===========================================================================
function Trig_magicshield_Conditions takes nothing returns boolean
    local unit t
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    if  l == 'A00Z' then
        call UnitAddItemToSlotById( u, 'rsps', 0 )
    elseif  l == 'A00W' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\[AKE]war3AKE.com - 4824137662399555907875383.mdx", t, "origin") )
            call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\NightElf\\EntBirthTarget\\EntBirthTarget.mdl", u, "origin") )
            call UnitDamageTarget( u, t, ((0.15*GetUnitAbilityLevel(u,'B01T'))+0.15+GetHeroLevel(u)/100)*(GetUnitState(t, UNIT_STATE_MAX_LIFE)-GetUnitState(t, UNIT_STATE_LIFE)), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
        endif
    endif
    
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_magicshield takes nothing returns nothing
    set gg_trg_magicshield = CreateTrigger(  )
    call DisableTrigger( gg_trg_magicshield )
    call TriggerAddCondition( gg_trg_magicshield, Condition( function Trig_magicshield_Conditions ) )
endfunction
