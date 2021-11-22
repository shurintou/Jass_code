
//===========================================================================
// Trigger: yanmu
//
// ljz的雾不能刷新使用
//===========================================================================
function Trig_yanmu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'ANc3' 
endfunction

function yanmuact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local integer n=LoadInteger(udg_Hash1,i,4)

if n>0 then
call SaveInteger(udg_Hash1,i,4,n-1)
call IssuePointOrderById( u, 852592, LoadReal(udg_Hash1,i,2), LoadReal(udg_Hash1,i,3) )
else
call RemoveUnit(u)
call DestroyEffect(LoadEffectHandle(udg_Hash1,i,5))
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
endfunction

function Trig_yanmu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local unit n=CreateUnit(GetTriggerPlayer(),'n001',x,y,0)
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)

call UnitAddAbility( n, 'A06F' )
call SetUnitAbilityLevel( n, 'A06F', GetUnitAbilityLevel(u,'ANc3') )
call IssuePointOrderById( n, 852592, x, y )
call SaveUnitHandle(udg_Hash1,i,1,n)
call SaveReal(udg_Hash1,i,2,x)
call SaveReal(udg_Hash1,i,3,y)
call SaveInteger(udg_Hash1,i,4,20)
call SaveEffectHandle(udg_Hash1,i,5,AddSpecialEffect("Abilities\\Spells\\Human\\CloudOfFog\\CloudOfFog.mdl", x, y))
call TimerStart(tm,0.3,true,function yanmuact)

set tm=null
set u=null
set n=null
endfunction

//===========================================================================
function InitTrig_yanmu takes nothing returns nothing
    set gg_trg_yanmu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_yanmu, Condition( function Trig_yanmu_Conditions ) )
    call TriggerAddAction( gg_trg_yanmu, function Trig_yanmu_Actions )
endfunction
