
//===========================================================================
// Trigger: 未命名触发器 003 复制
//===========================================================================
function Trig_003_u_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'AEme' ) ) then
        return false
    endif
    return true
endfunction

function Trig_003_u_Actions takes nothing returns nothing
    set udg_emo = GetTriggerUnit()
    call SetUnitAbilityLevelSwapped( 'A0C3', GetTriggerUnit(), GetUnitAbilityLevelSwapped('AEme', GetTriggerUnit()) )
    call TriggerSleepAction( 1.51 )
    call IssueImmediateOrder( udg_emo, "locustswarm" )
endfunction

//===========================================================================
function InitTrig_003_u takes nothing returns nothing
    set gg_trg_003_u = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_003_u, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_003_u, Condition( function Trig_003_u_Conditions ) )
    call TriggerAddAction( gg_trg_003_u, function Trig_003_u_Actions )
endfunction
