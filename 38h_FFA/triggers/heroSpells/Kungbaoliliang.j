
//===========================================================================
// Trigger: Kungbaoliliang
//
// set sc=1.3+0.08*n
//===========================================================================
function Trig_Kungbaoliliang_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A07W' 
endfunction


function bianwanshen takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1, n, 1)

call DisableTrigger( gg_trg_LessHarm )
call UnitRemoveAbility( u, 'Amgr' )
call UnitRemoveAbility( u, 'B01Y' )
call EnableTrigger( gg_trg_LessHarm )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A07W', true )

call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set u=null
endfunction

function bianxiao takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1, n, 1)
local integer i=LoadInteger(udg_Hash1,n,2)
local real sc=LoadReal(udg_Hash1,n,3)

call UnitRemoveAbility( u, 'B01Y' )
set sc=sc-0.02*i
if sc<=1 then
call SetUnitScale( u, 1, 1, 1 )
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)
else
call SaveInteger(udg_Hash1,n,2,i+1)
call SetUnitScale( u, sc, sc, sc )
endif

set tm=null
set u=null
endfunction


function Trig_Kungbaoliliang_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local integer d
local unit m
local integer n
local real sc
local integer i

call SetUnitAnimation( u, "spell" )
if GetUnitAbilityLevel(u,'Asp1')==0 then
set d=GetHandleId(u)
call SetUnitAbilityLevel(u,'A085',GetUnitAbilityLevel(u,'A07W'))
set m=LoadUnitHandle(udg_Hash1,d,9467)
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A07W', false )
call UnitAddAbility( u, 'Amgr' )
if m==null then
set m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
call SaveUnitHandle(udg_Hash1,d,9467,m)
call UnitAddAbility(m,'ACbl')
else
call SetUnitAbilityLevel(m,'ACbl',1)
call SaveReal(udg_Hash1,d,9466,0)
endif
call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,u)
call TimerStart(tm,15+5*GetUnitAbilityLevel(u,'A07W'),false,function bianwanshen)
else
//set n=GetUnitAbilityLevel(u,'B01Y')
//set i=GetHandleId(tm)
//set sc=1.3+0.08*n
call DisableTrigger( gg_trg_LessHarm )
call UnitRemoveAbility( u, 'B01Y' )
call EnableTrigger( gg_trg_LessHarm )
//call SaveInteger(udg_Hash1,i,2,0)
//call SaveReal(udg_Hash1,i,3,sc)
//call SetUnitScale( u, sc, sc, sc )
//call SaveUnitHandle(udg_Hash1,i,1,u)
//call TimerStart(tm,0.03,true,function bianxiao)
endif

set tm=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_Kungbaoliliang takes nothing returns nothing
    set gg_trg_Kungbaoliliang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Kungbaoliliang, Condition( function Trig_Kungbaoliliang_Conditions ) )
    call TriggerAddAction( gg_trg_Kungbaoliliang, function Trig_Kungbaoliliang_Actions )
endfunction
