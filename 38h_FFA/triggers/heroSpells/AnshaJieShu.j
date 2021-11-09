
//===========================================================================
// Trigger: AnshaJieShu
//===========================================================================
function Trig_AnshaJieShu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0B4' 
endfunction

function Trig_AnshaJieShu_Actions takes nothing returns nothing
    local unit t= GetSpellTargetUnit()
    call UnitRemoveAbility( t, 'A0B5' )
    call UnitRemoveAbility( t, 'B03Q' )
    call UnitShareVision(t,GetTriggerPlayer(), false )
    set t=null
endfunction

//===========================================================================
function InitTrig_AnshaJieShu takes nothing returns nothing
    set gg_trg_AnshaJieShu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AnshaJieShu, Condition( function Trig_AnshaJieShu_Conditions ) )
    call TriggerAddAction( gg_trg_AnshaJieShu, function Trig_AnshaJieShu_Actions )
endfunction
