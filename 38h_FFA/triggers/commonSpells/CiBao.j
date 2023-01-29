
//===========================================================================
// Trigger: CiBao
//===========================================================================
function Trig_CiBao_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A09J' 
endfunction


function CiBaoAct takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash3,i,3)
local unit m=LoadUnitHandle(udg_Hash3,i,2)
local integer h
local real r
local integer level=LoadInteger(udg_Hash3,i,5)

if n>0 then
set h=LoadInteger(udg_Hash3,i,4)+1
set r=1+0.2*h*level
call SaveInteger(udg_Hash3,i,4,h)
call SaveInteger(udg_Hash3,i,3,n-1)
call SetUnitScale( m, r, r, r )
call SetUnitTimeScale( m, 0.5+0.02*h )
else
call IssueImmediateOrderById( m, 852096 )
call IssuePointOrderById( m, 852145, GetUnitX(m), GetUnitY(m) )
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif
set tm=null
set m=null
endfunction

function Trig_CiBao_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit u=GetTriggerUnit()
local unit m=CreateUnit(GetTriggerPlayer(),'opeo',GetSpellTargetX(),GetSpellTargetY(),0)
local integer level=GetUnitAbilityLevel(u,'A09J')
call SetUnitTimeScale( m, 0.5 )
call SetUnitAbilityLevel( m, 'A09L', level )
call SetUnitAbilityLevel( m, 'A09K', level )
//call SaveUnitHandle(udg_Hash3,i,1,u)
call SaveUnitHandle(udg_Hash3,i,2,m)
call SaveInteger(udg_Hash3,i,3,46-level*6)
call SaveInteger(udg_Hash3,i,4,0)
call SaveInteger(udg_Hash3,i,5,level)
call TimerStart(tm,0.1,true,function CiBaoAct)
set tm=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_CiBao takes nothing returns nothing
    set gg_trg_CiBao = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_CiBao, Condition( function Trig_CiBao_Conditions ) )
    call TriggerAddAction( gg_trg_CiBao, function Trig_CiBao_Actions )
endfunction
