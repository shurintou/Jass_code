
//===========================================================================
// Trigger: DarkQiYue
//
// if GetUnitState(m, UNIT_STATE_LIFE) >0 and n>0 then
//   set u=LoadUnitHandle(udg_Hash2,i,0)
//   set g=CreateGroup()
//   call GroupEnumUnitsInRange(g,GetUnitX(m),GetUnitY(m),350,null)
//   set p=GetOwningPlayer(u)
//   set level=GetUnitAbilityLevel(u,'A0A9')
//   set r=15+15*level
//   loop
//   set t=FirstOfGroup(g)
//   exitwhen t==null
//     if IsUnitEnemy(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) > 0.00 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0 and t!=m then
//     call UnitDamageTarget( u, t, r, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
//     endif
//   call GroupRemoveUnit(g,t)
//   set t=null
//   endloop
//   call SaveInteger(udg_Hash2,i,3,n-1)
//   call DestroyGroup(g)
// else
// call DestroyEffect(LoadEffectHandle(udg_Hash2,i,2))
// call FlushChildHashtable( udg_Hash2, i )
// call PauseTimer(tm)
// call DestroyTimer(tm)
// endif
//===========================================================================
function Trig_DarkQiYue_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0AS' 
endfunction


function darkactww takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash2,i,1)
local group g
local player p
local unit t
local integer level
local real r

if GetUnitState(u, UNIT_STATE_LIFE) >0 then
  set g=CreateGroup()
  call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),325,null)
  set p=GetOwningPlayer(u)
  set level=GetUnitAbilityLevel(u,'A0AS')
  set r=75*level
  loop
  set t=FirstOfGroup(g)
  exitwhen t==null
    if IsUnitEnemy(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) > 0.00 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0 then
    call UnitDamageTarget( u, t, r, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    endif
  call GroupRemoveUnit(g,t)
  set t=null
  endloop
  call DestroyGroup(g)

call yichubuff(u)
call UnitDamageTarget( u, u, 0.5*r, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\ShadowTrap.mdx", u, "origin") )
endif

call FlushChildHashtable( udg_Hash2, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set g=null
set tm=null
set u=null
set t=null
set p=null
endfunction

function Trig_DarkQiYue_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
call SaveUnitHandle(udg_Hash2,GetHandleId(tm),1,u)
call TimerStart(tm,1.5,false,function darkactww)

set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_DarkQiYue takes nothing returns nothing
    set gg_trg_DarkQiYue = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_DarkQiYue, Condition( function Trig_DarkQiYue_Conditions ) )
    call TriggerAddAction( gg_trg_DarkQiYue, function Trig_DarkQiYue_Actions )
endfunction
