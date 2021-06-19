
//===========================================================================
// Trigger: AttackWithHuiJi
//
// 确定才开启触发否则关闭
//===========================================================================
function Trig_AttackWithHuiJi_Conditions takes nothing returns boolean
    if IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true  then
    call EnableTrigger( gg_trg_PanDuanHuiJi )
    return true    
    endif
    call DisableTrigger( gg_trg_PanDuanHuiJi )
    return false
endfunction

function Trig_AttackWithHuiJi_Actions takes nothing returns nothing
local unit t=GetEventTargetUnit()
local unit u=GetTriggerUnit()
if GetUnitState(t, UNIT_STATE_LIFE)/GetUnitState(t, UNIT_STATE_MAX_LIFE)<0.5 then
call SetUnitAbilityLevel( u, 'A09Y', GetUnitAbilityLevel(u, 'A09Z')+3 )
else
call SetUnitAbilityLevel( u, 'A09Y', GetUnitAbilityLevel(u, 'A09Z'))
endif
call SaveUnitHandle(udg_Hash1,GetHandleId(u),2872,t)
set t=null
set u=null
endfunction

//===========================================================================
function InitTrig_AttackWithHuiJi takes nothing returns nothing
    set gg_trg_AttackWithHuiJi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AttackWithHuiJi, Condition( function Trig_AttackWithHuiJi_Conditions ) )
    call TriggerAddAction( gg_trg_AttackWithHuiJi, function Trig_AttackWithHuiJi_Actions )
endfunction
