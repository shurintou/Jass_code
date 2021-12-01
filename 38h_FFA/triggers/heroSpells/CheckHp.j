
//===========================================================================
// Trigger: CheckHp
//
// udg_CheckHpGroup 鑫头用的单位组
// udg_Hash1,GetHandleId(u),249,鑫头检测加速Buff用
//===========================================================================
function Trig_CheckHp_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A05U' 
endfunction

function AddSpeedByHp takes nothing returns nothing
local unit m=GetEnumUnit()
local player p=GetOwningPlayer(udg_lsu)
local real x=GetUnitX(m)
local real y=GetUnitY(m)
local real dx=x-GetUnitX(udg_lsu)
local real dy=y-GetUnitY(udg_lsu)
//local unit g
local integer i=0

if GetUnitLifePercent(m) < 40 and IsUnitEnemy(m, p) == true and SquareRoot(dx * dx + dy * dy)<3500 and GetUnitState(m, UNIT_STATE_LIFE) > 0 then
set i=GetHandleId(udg_lsu)
//set g=LoadUnitHandle(udg_Hash2,i,362)
//call ShowUnit( g, true )
call UnitShareVision( m, p, true )
//call SetUnitX(g,x)
//call SetUnitY(g,y)
//call UnitUseItemTarget( g, UnitItemInSlot(g,0), m )
call SaveInteger(udg_Hash1,i,249,1)
else
//call UnitRemoveAbility(m,'Bshs')
call UnitShareVision( m, p, false )
endif


//set g=null
set m=null
set p=null
endfunction


function CheckHpAct takes nothing returns nothing
local timer tm=GetExpiredTimer()
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(tm),1)
local integer i=GetHandleId(u)

set udg_lsu=u
call SaveInteger(udg_Hash1,i,249,0)
call ForGroup(udg_CheckHpGroup,function AddSpeedByHp)
if LoadInteger(udg_Hash1,i,249)==1 then
call SetUnitAbilityLevel(u,'A039',GetUnitAbilityLevel(u,'A05U' ))
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A039', true )
else
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A039', false )
endif
//call ShowUnit( LoadUnitHandle(udg_Hash2,i,362), false )

set tm=null
set u=null
endfunction


function Trig_CheckHp_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,u)
call TimerStart(tm,1,true,function CheckHpAct)
call UnitAddAbility(u,'A039')
call UnitRemoveAbility( u, 'B00Z' )
call DestroyTrigger( GetTriggeringTrigger() )
set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_CheckHp takes nothing returns nothing
    set gg_trg_CheckHp = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_CheckHp, Condition( function Trig_CheckHp_Conditions ) )
    call TriggerAddAction( gg_trg_CheckHp, function Trig_CheckHp_Actions )
endfunction
