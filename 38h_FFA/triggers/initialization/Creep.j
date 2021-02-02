
//===========================================================================
// Trigger: Creep
//
// call SaveTimerHandle(udg_Hash2,ni,1,tm)
// //call RemoveUnit(u)暂时不Remove看效果怎样
// local integer h=0
// local integer tf=0
// local integer ni=0
// loop
// exitwhen h>11 or tf==1
// if IsUnitInvisible(m, Player(h))==false then
// set tf=1
// call RemoveUnit(m)
// else
// endif
// set h=h+1
// endloop
//===========================================================================
function enumnocreep takes nothing returns boolean
return GetOwningPlayer(GetFilterUnit()) != Player(PLAYER_NEUTRAL_AGGRESSIVE) and GetOwningPlayer(GetFilterUnit()) != Player(PLAYER_NEUTRAL_PASSIVE)
endfunction



function revivecreep takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash2,i,5)
local unit m
local group g
local boolexpr b

if GetUnitState(u, UNIT_STATE_LIFE) <= 0 or GetOwningPlayer(u) != Player(PLAYER_NEUTRAL_AGGRESSIVE) then
set b=Condition(function enumnocreep)
set g=GetUnitsInRectMatching(udg_CreepRect[LoadInteger(udg_Hash2,i,7)], b)
if IsUnitGroupEmptyBJ(g)==true then
set m=CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE),LoadInteger(udg_Hash2,i,4),LoadReal(udg_Hash2,i,1),LoadReal(udg_Hash2,i,2),LoadReal(udg_Hash2,i,3))
call SetUnitState( m, UNIT_STATE_MANA, GetUnitState(m, UNIT_STATE_MAX_MANA)/2 )
call SaveUnitHandle(udg_Hash2,i,5,m)
call SetUnitAcquireRange( m, 200.00 )
endif
call DestroyBoolExpr(b)
call GroupClear(g)
call DestroyGroup(g)
endif

set g=null
set b=null
set u=null
set tm=null
set m=null
endfunction


function creepreviver takes nothing returns nothing
local unit u=GetEnumUnit()
local timer tm=CreateTimer()
local integer n=GetHandleId(tm)
local integer i=1
loop
exitwhen i>18
if RectContainsUnit(udg_CreepRect[i], u) then
call SaveInteger( udg_Hash2, n, 7, i )//中立生物所在的区域索引号
set i=100
endif
set i=i+1
endloop
call SetUnitAcquireRange( u, 200.00 )
call SaveReal(udg_Hash2,n,1,GetUnitX(u))
call SaveReal(udg_Hash2,n,2,GetUnitY(u))
call SaveReal(udg_Hash2,n,3,GetUnitFacing(u))
call SaveInteger(udg_Hash2,n,4,GetUnitTypeId(u))
call SaveUnitHandle(udg_Hash2,n,5,u)
call TimerStart(tm,60,true,function revivecreep)
set u=null
set tm=null
endfunction

function Trig_Creep_Actions takes nothing returns nothing
    local group g=GetUnitsInRectOfPlayer(GetPlayableMapRect(), Player(PLAYER_NEUTRAL_AGGRESSIVE))
    call GroupRemoveUnit( g, gg_unit_Hamg_0130 )
    call GroupRemoveUnit( g, gg_unit_nwlt_0108 )
    call ForGroup(g,function creepreviver)
    call GroupClear(g)
    call DestroyGroup(g)
    call SetUnitPathing( CreateUnit( Player(PLAYER_NEUTRAL_AGGRESSIVE), 'n00R', 6720, 4660, 270), false )
    set g=null
endfunction

//===========================================================================
function InitTrig_Creep takes nothing returns nothing
    set gg_trg_Creep = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_Creep, 1.00 )
    call TriggerAddAction( gg_trg_Creep, function Trig_Creep_Actions )
endfunction
