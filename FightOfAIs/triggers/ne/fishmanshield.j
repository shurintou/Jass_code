
//===========================================================================
// Trigger: fishmanshield
//
// 
//===========================================================================
function Trig_fishmanshield_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    
    call UnitRemoveAbility( u, 'Bspl' )
    if GetRandomInt(1,60)<GetHeroLevel(u) then
        call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\NightElf\\NEDeathMedium\\NEDeath.mdl", u, "origin") )
        call Removedebuff(u)
    endif
    if GetPlayerController(GetTriggerPlayer()) == MAP_CONTROL_COMPUTER and GetUnitAbilityLevel(u, 'Bvul')==0 and GetUnitState(u, UNIT_STATE_LIFE) < 0.30 * GetUnitState(u, UNIT_STATE_MAX_LIFE) then
        call IssueImmediateOrderById(u, 852100 )
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_fishmanshield takes nothing returns nothing
    set gg_trg_fishmanshield = CreateTrigger(  )
    call DisableTrigger( gg_trg_fishmanshield)
    call TriggerAddCondition( gg_trg_fishmanshield, Condition( function Trig_fishmanshield_Conditions ) )
    
endfunction
