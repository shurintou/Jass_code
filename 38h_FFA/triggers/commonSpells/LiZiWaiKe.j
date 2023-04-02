
//===========================================================================
// Trigger: LiZiWaiKe
//===========================================================================
function Trig_LiZiWaiKe_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0A9' 
endfunction

function liziact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u
local unit m=LoadUnitHandle(udg_Hash2,i,1)
local group g
local unit t
local player p
local real r
local integer level
local integer n=LoadInteger(udg_Hash2,i,3)

if GetUnitState(m, UNIT_STATE_LIFE) >0 and n>0 then
  set u=LoadUnitHandle(udg_Hash2,i,0)
  set g=CreateGroup()
  call GroupEnumUnitsInRange(g,GetUnitX(m),GetUnitY(m),350,null)
  set p=GetOwningPlayer(u)
  set level=GetUnitAbilityLevel(u,'A0A9')
  set r=15+15*level
  loop
  set t=FirstOfGroup(g)
  exitwhen t==null
    if IsUnitEnemy(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) > 0.00 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0 and t!=m then
    call UnitDamageTarget( u, t, r, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    endif
  call GroupRemoveUnit(g,t)
  set t=null
  endloop
  call SaveInteger(udg_Hash2,i,3,n-1)
  call DestroyGroup(g)
else
call DestroyEffect(LoadEffectHandle(udg_Hash2,i,2))
call FlushChildHashtable( udg_Hash2, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set u=null
set g=null
set m=null
set tm=null
set t=null
set p=null
endfunction


function Trig_LiZiWaiKe_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit t=GetSpellTargetUnit()
call SaveUnitHandle(udg_Hash2,i,0,GetTriggerUnit())
call SaveUnitHandle(udg_Hash2,i,1,t)
call SaveEffectHandle(udg_Hash2,i,2,AddSpecialEffectTarget("war3mapImported\\Sun.mdx", t, "origin"))
call SaveInteger(udg_Hash2,i,3,15)
call TimerStart(tm,1,true,function liziact)
set tm=null
set t=null
endfunction

//===========================================================================
function InitTrig_LiZiWaiKe takes nothing returns nothing
    set gg_trg_LiZiWaiKe = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LiZiWaiKe, Condition( function Trig_LiZiWaiKe_Conditions ) )
    call TriggerAddAction( gg_trg_LiZiWaiKe, function Trig_LiZiWaiKe_Actions )
endfunction
