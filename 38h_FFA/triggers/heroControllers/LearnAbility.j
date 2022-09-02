
//===========================================================================
// Trigger: LearnAbility
//
// 获得英雄的两个技能
// 332：英雄的小技能///333：英雄的大招
// 334：对英雄个人关闭此触发
//===========================================================================
function Trig_LearnAbility_Conditions takes nothing returns boolean
    return GetLearnedSkill() != 'Aamk' 
endfunction



function Trig_LearnAbility_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=GetHandleId(u)
local integer i2=LoadInteger(udg_Hash3,i,332)
local integer n=GetLearnedSkill()

if LoadInteger(udg_Hash3,i,333) !=0 then
else
if i2 == 0 then
call SaveInteger(udg_Hash3,i,332,n)
else
if i2!=n then
call SaveInteger(udg_Hash3,i,333,n)
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_LearnAbility takes nothing returns nothing
    set gg_trg_LearnAbility = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnAbility, Condition( function Trig_LearnAbility_Conditions ) )
    call TriggerAddAction( gg_trg_LearnAbility, function Trig_LearnAbility_Actions )
endfunction
