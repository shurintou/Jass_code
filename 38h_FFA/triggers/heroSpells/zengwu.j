
//===========================================================================
// Trigger: zengwu
//===========================================================================
function Trig_zengwu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A09E' 
endfunction


function werwewer takes integer i returns integer 
if i==1 then
return 1
else
if i==4 then
return 3
else
return 2
endif
endif
endfunction


function harmzengwu takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t
local unit m
local integer level
local integer n=LoadInteger(udg_Hash1,i,3)

if n==0 then
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
else
set t=LoadUnitHandle(udg_Hash1,i,2)
set m=LoadUnitHandle(udg_Hash1,i,1)
call SetUnitX(m,GetUnitX(t))
call SetUnitY(m,GetUnitY(t))
call IssueTargetOrderById( m, 852095, t )
call SaveInteger(udg_Hash1,i,3,n-1)
endif

set tm=null
set t=null
set m=null
endfunction



function ZECheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local unit m
local timer tt
local integer level
local integer n

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set tt=CreateTimer()
set n=GetHandleId(tt)
set u=LoadUnitHandle(udg_Hash3,i,1)
set level=GetUnitAbilityLevel(u,'A09E')
set m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(t),GetUnitY(t),0)
call UnitAddAbility(m,'A09F')
call SetUnitAbilityLevel( m, 'A09F',level)
call IssueTargetOrderById( m, 852095, t )
call UnitApplyTimedLife( m, 'BTLF', 10.00 )
call SaveInteger(udg_Hash1,n,3,werwewer(level))
call SaveUnitHandle(udg_Hash1,n,2,t)
call SaveUnitHandle(udg_Hash1,n,1,m)
call TimerStart(tt,2,true,function harmzengwu)
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
set m=null
set tt=null
endfunction

function Trig_zengwu_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function ZECheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_zengwu takes nothing returns nothing
    set gg_trg_zengwu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zengwu, Condition( function Trig_zengwu_Conditions ) )
    call TriggerAddAction( gg_trg_zengwu, function Trig_zengwu_Actions )
endfunction
