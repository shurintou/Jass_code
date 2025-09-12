
//===========================================================================
// Trigger: VNW1
//===========================================================================
function Trig_VNW1_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    if GetUnitAbilityLevel(u,'Agho')>0 and GetUnitAbilityLevel(u,'Apiv')>0 then
        call PauseUnit( u, true )
        call PauseUnit( u, false)
    endif
    if IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and GetOwningPlayer(t) != Player(PLAYER_NEUTRAL_AGGRESSIVE) then
        call IssueTargetOrderById( u, 852095, t )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\BallistaMissile\\BallistaMissileTarget.mdl", t, "origin") )
        call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", t, "chest") )
        call UnitDamageTarget( u, t, GetUnitState(t, UNIT_STATE_MAX_LIFE)*(0.01+(GetHeroLevel(u)/300)), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
    endif
    set u=null
    set t=null
    return false
endfunction


//===========================================================================
function InitTrig_VNW1 takes nothing returns nothing
    set gg_trg_VNW1 = CreateTrigger(  )
    call DisableTrigger(gg_trg_VNW1)
    call TriggerAddCondition( gg_trg_VNW1, Condition( function Trig_VNW1_Conditions ) )
endfunction
