
//===========================================================================
// Trigger: AnshaZhunbei
//===========================================================================
function Trig_AnshaZhunbei_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0B4' 
endfunction

function Trig_AnshaZhunbei_Actions takes nothing returns nothing
    local unit t= GetSpellTargetUnit()
    call UnitAddAbility( t, 'A0B5' )
    call UnitShareVision(t,GetTriggerPlayer(), true )
    set t=null
endfunction

//===========================================================================
function InitTrig_AnshaZhunbei takes nothing returns nothing
    set gg_trg_AnshaZhunbei = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AnshaZhunbei, Condition( function Trig_AnshaZhunbei_Conditions ) )
    call TriggerAddAction( gg_trg_AnshaZhunbei, function Trig_AnshaZhunbei_Actions )
endfunction
