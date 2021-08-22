
//===========================================================================
// Trigger: Zhuanyishanghai
//
// and  GetUnitTypeId(GetEventDamageSource())!= 'e000'
// local real x=GetUnitX(m)
// local real y=GetUnitY(m)
// local real dx=GetUnitX(u)
// local real dy=GetUnitY(u)
// local real ex=dx-x
// local real ey=dy-y
// if IsUnitEnemy(u, GetOwningPlayer(m)) and then
//===========================================================================
function Trig_Zhuanyishanghai_Conditions takes nothing returns boolean
   return IsUnitEnemy(GetEventDamageSource(), GetTriggerPlayer()) and GetEventDamage() > 0 
endfunction

function silinguphpuphp takes nothing returns nothing
local integer i=GetHandleId(gg_trg_Zhuanyishanghai)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local integer level=GetUnitAbilityLevel(u, 'A0B6')
local real l=LoadReal(udg_Hash1,i,2)
local real r=l*0.05*level
local unit t=GetEnumUnit()
call SetUnitState( t, UNIT_STATE_LIFE, GetUnitState(t, UNIT_STATE_LIFE)+r )
call SetUnitMoveSpeed( t, GetUnitMoveSpeed(u) )
set u=null
set t=null
endfunction


function uphpuphp takes nothing returns nothing
local unit t=GetEnumUnit()
local integer i=GetHandleId(gg_trg_Zhuanyishanghai)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local integer level
local real l
local real r
local real dx
local real dy


if IsUnitEnemy(t, GetOwningPlayer(u))==false then
set dx=GetUnitX(t)-GetUnitX(u)
set dy=GetUnitY(t)-GetUnitY(u)
  if u==t or SquareRoot(dx*dx+dy*dy)<1000 then
  set level=GetUnitAbilityLevel(u, 'A0B6')
  set l=LoadReal(udg_Hash1,i,2)
  set r=l*0.05*level
  call SetUnitState( t, UNIT_STATE_LIFE, GetUnitState(t, UNIT_STATE_LIFE)+r )
  endif
endif

set u=null
set t=null
endfunction


function Trig_Zhuanyishanghai_Actions takes nothing returns nothing
local integer i=GetHandleId(gg_trg_Zhuanyishanghai)
call SaveReal(udg_Hash1,i,2,GetEventDamage())
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\SpellSteal\\SpellStealTarget.mdl", GetTriggerUnit(), "chest") )
call ForGroup(udg_CheckHpGroup,function uphpuphp)
call ForGroup(LoadGroupHandle(udg_Hash1,i,4),function silinguphpuphp)
endfunction

//===========================================================================
function InitTrig_Zhuanyishanghai takes nothing returns nothing
    set gg_trg_Zhuanyishanghai = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Zhuanyishanghai, Condition( function Trig_Zhuanyishanghai_Conditions ) )
    call TriggerAddAction( gg_trg_Zhuanyishanghai, function Trig_Zhuanyishanghai_Actions )
endfunction
