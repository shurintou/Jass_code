
//===========================================================================
// Trigger: zhimingyijiC
//===========================================================================
function Trig_zhimingyijiC_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true and GetUnitAbilityLevel(GetTriggerUnit(),'A0BY')>0
endfunction

function Trig_zhimingyijiC_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u,'A0BY')
local integer n=0

if GetUnitAbilityLevel(u,'B03W')>0 then
  set n=4+level
else
  set n=GetRandomInt(1+level,4+level)
endif
call SetUnitAbilityLevel( u, 'A0BZ', n )
set u=null
endfunction

//===========================================================================
function InitTrig_zhimingyijiC takes nothing returns nothing
    set gg_trg_zhimingyijiC = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zhimingyijiC, Condition( function Trig_zhimingyijiC_Conditions ) )
    call TriggerAddAction( gg_trg_zhimingyijiC, function Trig_zhimingyijiC_Actions )
endfunction
