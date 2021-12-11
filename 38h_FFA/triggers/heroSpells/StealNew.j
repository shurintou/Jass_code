
//===========================================================================
// Trigger: StealNew
//===========================================================================
function Trig_StealNew_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true and IsUnitType(GetEventTargetUnit(), UNIT_TYPE_HERO) == true and IsUnitType(GetEventTargetUnit(), UNIT_TYPE_MAGIC_IMMUNE)==false and IsUnitIllusion(GetEventTargetUnit()) == false
endfunction

function rreturnSAI takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,3)
local unit m=LoadUnitHandle(udg_Hash1,i,1)
local integer n=LoadInteger(udg_Hash1,i,7)

if n>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
call SaveInteger(udg_Hash1,i,7,n-1)
else
call SetHeroAgi(u,GetHeroAgi(u, false)-2,true)
call SetHeroStr(m,GetHeroStr(m, false)+LoadInteger(udg_Hash1,i,26),true)
call SetHeroAgi(m,GetHeroAgi(m, false)+LoadInteger(udg_Hash1,i,27),true)
call SetHeroInt(m,GetHeroInt(m, false)+LoadInteger(udg_Hash1,i,28),true)
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif


set u=null
set m=null
set tm=null
endfunction


function Trig_StealNew_Actions takes nothing returns nothing
local unit m=GetEventTargetUnit()
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer st=GetHeroStr(m, false)
local integer ag=GetHeroAgi(m, false)
local integer in=GetHeroInt(m, false)
local integer i=GetHandleId(tm)

call SetHeroAgi(u,GetHeroAgi(u, false)+2,true)

if st>0 then
call SetHeroStr(m,st-1,true)
call SaveInteger(udg_Hash1,i,26,1 )
else
call SaveInteger(udg_Hash1,i,26,0 )
call SetHeroStr(m,0,true)
endif

if ag>0 then
call SetHeroAgi(m,ag-1,true)
call SaveInteger(udg_Hash1,i,27,1 )
else
call SaveInteger(udg_Hash1,i,27,0 )
call SetHeroAgi(m,0,true)
endif

if in>0 then
call SetHeroInt(m,in-1,true)
call SaveInteger(udg_Hash1,i,28,1 )
else
call SaveInteger(udg_Hash1,i,28,0 )
call SetHeroInt(m,0,true)
endif


call SaveUnitHandle(udg_Hash1,i,1,m)
call SaveUnitHandle(udg_Hash1,i,3,u)
call SaveInteger(udg_Hash1,i,7,100)
call TimerStart(tm,1,true,function rreturnSAI)


set u=null
set tm=null
set m=null
endfunction

//===========================================================================
function InitTrig_StealNew takes nothing returns nothing
    set gg_trg_StealNew = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_StealNew, Condition( function Trig_StealNew_Conditions ) )
    call TriggerAddAction( gg_trg_StealNew, function Trig_StealNew_Actions )
endfunction
