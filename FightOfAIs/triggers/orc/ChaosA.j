
//===========================================================================
// Trigger: ChaosA
//===========================================================================
function Trig_ChaosA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer i=GetHeroLevel(u)
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852095, t )
        call IssueImmediateOrderById( u, 852183 )
    endif
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Devour\\DevourEffectArt.mdl",t, "chest") )
    call UnitDamageTarget( u, t, GetRandomReal(i,i+udg_UGharm[GetConvertedPlayerId(GetTriggerPlayer())]), true, false, ATTACK_TYPE_CHAOS,DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
    if GetUnitState(t, UNIT_STATE_LIFE)/GetUnitState(t, UNIT_STATE_MAX_LIFE)<0.4 then
        call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A09A', true )
    else
        call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A09A', false )
    endif
    
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_ChaosA takes nothing returns nothing
    set gg_trg_ChaosA = CreateTrigger(  )
    call DisableTrigger( gg_trg_ChaosA )
    call TriggerAddCondition( gg_trg_ChaosA, Condition( function Trig_ChaosA_Conditions ) )
endfunction
