
//===========================================================================
// Trigger: JiduKewang
//===========================================================================
function Trig_JiduKewang_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) and GetUnitAbilityLevel(GetTriggerUnit(),'B019')>0  
endfunction

function Trig_JiduKewang_Actions takes nothing returns nothing
local unit t=GetEventTargetUnit()
call UnitAddAbility(t,'A0AP')
call UnitRemoveAbility(t,'A0AP')
set t=null
endfunction

//===========================================================================
function InitTrig_JiduKewang takes nothing returns nothing
    set gg_trg_JiduKewang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_JiduKewang, Condition( function Trig_JiduKewang_Conditions ) )
    call TriggerAddAction( gg_trg_JiduKewang, function Trig_JiduKewang_Actions )
endfunction
