
//===========================================================================
// Trigger: learnhuangwu
//===========================================================================
function Trig_learnhuangwu_Conditions takes nothing returns boolean
     return GetLearnedSkill() == 'AEev' 
endfunction

function Trig_learnhuangwu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

call TriggerRegisterUnitEvent( gg_trg_ZheShe, u, EVENT_UNIT_DAMAGED )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_ZheShe),1,u)
call TriggerRegisterUnitEvent( gg_trg_HuangWu, u, EVENT_UNIT_TARGET_IN_RANGE )
call DestroyTrigger( GetTriggeringTrigger() )

set u=null
endfunction

//===========================================================================
function InitTrig_learnhuangwu takes nothing returns nothing
    set gg_trg_learnhuangwu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_learnhuangwu, Condition( function Trig_learnhuangwu_Conditions ) )
    call TriggerAddAction( gg_trg_learnhuangwu, function Trig_learnhuangwu_Actions )
endfunction
