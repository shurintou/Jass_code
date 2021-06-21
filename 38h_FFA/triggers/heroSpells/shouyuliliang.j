
//===========================================================================
// Trigger: shouyuliliang
//
// A09B,A09A
//===========================================================================
function Trig_shouyuliliang_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A09D' 
endfunction


function shouyuqqqqq takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit m=LoadUnitHandle(udg_Hash1,i,1)
local integer n=LoadInteger(udg_Hash1,GetHandleId(m),7492)
if n>0 then
call SaveInteger(udg_Hash1,GetHandleId(m),7492,n-1)
else
call UnitRemoveAbility(m,'A09C')
call UnitRemoveAbility(m,'B030')
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set m=null
endfunction


function Trig_shouyuliliang_Actions takes nothing returns nothing
local timer tm
local unit u=GetTriggerUnit()
local unit t=GetSpellTargetUnit()
local integer level=GetUnitAbilityLevel(u,'A09D')
local integer i
if GetUnitAbilityLevel(t,'B030')>0 then
call SaveInteger(udg_Hash1,GetHandleId(t),7492,30)
else
set tm=CreateTimer()
set i=GetHandleId(tm)
call SetPlayerAbilityAvailable( GetOwningPlayer(t), 'A09C', false )
call UnitAddAbility(t,'A09C')
call SetUnitAbilityLevel(t,'A09B',level)
call SetUnitAbilityLevel(t,'A09A',level)
call SaveUnitHandle(udg_Hash1,i,1,t)
call SaveInteger(udg_Hash1,GetHandleId(t),7492,30)
call TimerStart(tm,1,true,function shouyuqqqqq)
endif
set u=null
set t=null
set tm=null
endfunction

//===========================================================================
function InitTrig_shouyuliliang takes nothing returns nothing
    set gg_trg_shouyuliliang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_shouyuliliang, Condition( function Trig_shouyuliliang_Conditions ) )
    call TriggerAddAction( gg_trg_shouyuliliang, function Trig_shouyuliliang_Actions )
endfunction
