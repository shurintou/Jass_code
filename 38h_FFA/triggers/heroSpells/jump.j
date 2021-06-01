
//===========================================================================
// Trigger: jump
//
// set n=GetConvertedPlayerId(GetOwningPlayer(u))
// set x=GetUnitX(u)
// set y=GetUnitY(u)
// call SetUnitFacing(u,LoadReal(udg_Hash1,i,5))
// set u=CreateUnit(Player(n-1),'n001',x,y,0)
// call UnitAddAbility( u, 'A06J' )
// call UnitApplyTimedLife( u, 'BTLF', 1.5 )
//===========================================================================
function Trig_jump_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0B9' 
endfunction



function jumpact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash1,i,4)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local real x=0
local real y=0
if n>0 then

//call QueueUnitAnimation( u, "attack spell slam" )
call SetUnitX(u,RealX(GetUnitX(u)+LoadReal(udg_Hash1,i,2)))
call SetUnitY(u,RealY(GetUnitY(u)+LoadReal(udg_Hash1,i,3)))
call SaveInteger(udg_Hash1,i,4,n-1)

else
call PauseUnit( u, false )
//call SetUnitTimeScalePercent( u, 100 )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif
set tm=null
set u=null
endfunction

function downjump takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
call SetUnitFlyHeight(  u, 0.00, 960.00 )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
set tm=null
set u=null
endfunction



function Trig_jump_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit u=GetTriggerUnit()
local real face=3.1415926*GetUnitFacing(u)/180
local real dx=20*Cos(face)
local real dy=20*Sin(face)
local timer tt=CreateTimer()
call PauseUnit( u, true )
//call SetUnitTimeScalePercent( u, 100 )
call SetUnitAnimation( u, "attack spell slam" )
call UnitAddAbility( u, 'Amrf' )
call UnitRemoveAbility( u, 'Amrf' )
call SetUnitFlyHeight(  u, 336.00, 960.00 )
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveUnitHandle(udg_Hash1,GetHandleId(tt),1,u)
call SaveReal(udg_Hash1,i,2,dx)
call SaveReal(udg_Hash1,i,3,dy)
call SaveInteger(udg_Hash1,i,4,35)
call SaveReal(udg_Hash1,i,5,face)
call TimerStart(tm,0.02,true,function jumpact)
call TimerStart(tt,0.35,false,function downjump)

//call QueueUnitAnimation( u, "attack spell slam" )
set tt=null
set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_jump takes nothing returns nothing
    set gg_trg_jump = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_jump, Condition( function Trig_jump_Conditions ) )
    call TriggerAddAction( gg_trg_jump, function Trig_jump_Actions )
endfunction
