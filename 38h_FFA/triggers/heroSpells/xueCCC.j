
//===========================================================================
// Trigger: xueCCC
//===========================================================================
function Trig_xueCCC_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A0CG'  
endfunction

function huihuCCC takes nothing returns nothing
local integer n=GetHandleId(gg_trg_xueCCC)
local integer i=LoadInteger(udg_Hash1,n,1)
local integer bi=LoadInteger(udg_Hash1,n,2)
local unit u
local integer level=0
local integer ggg

if bi==0 then
  if i>0 then
  call SaveInteger(udg_Hash1,n,1,i-1)
  else
  set ggg=GetHandleId(gg_trg_CCCkaominjie)
  set u=LoadUnitHandle(udg_Hash1,ggg,1)
  call UnitAddAbility(u, 'A0CG' )
  call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A0CG', true)
  call SaveInteger(udg_Hash1,n,2,1)
  call SetUnitAbilityLevel( u, 'A0CG', LoadInteger(udg_Hash1,ggg,2) )
  endif
else
endif


set u=null
endfunction


function Trig_xueCCC_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=GetHandleId(gg_trg_xueCCC)
call TimerStart(CreateTimer(),1,true,function huihuCCC)
call SaveInteger(udg_Hash1,i,1,7)
call SaveInteger(udg_Hash1,i,2,1)
call DisableTrigger( GetTriggeringTrigger() )
set u=null
endfunction

//===========================================================================
function InitTrig_xueCCC takes nothing returns nothing
    set gg_trg_xueCCC = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_xueCCC, Condition( function Trig_xueCCC_Conditions ) )
    call TriggerAddAction( gg_trg_xueCCC, function Trig_xueCCC_Actions )
endfunction
