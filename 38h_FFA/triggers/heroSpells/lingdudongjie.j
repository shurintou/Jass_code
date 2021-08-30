
//===========================================================================
// Trigger: lingdudongjie
//===========================================================================
function Trig_lingdudongjie_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0D9' 
endfunction


function houxushanghaiact takes nothing returns nothing
local integer c=GetHandleId( gg_trg_lingdudongjie)
local unit u=LoadUnitHandle(udg_Hash1,c,1)
local unit t=GetEnumUnit()
local integer i=GetUnitAbilityLevel(u,'A0D9')
local integer n=GetHandleId(t)
local real r=GetUnitState(t, UNIT_STATE_LIFE)
local real y=LoadReal(udg_Hash2,n,5459)

if r<=0 then
call GroupRemoveUnit(LoadGroupHandle(udg_Hash1,c,2),t)
call UnitRemoveAbility( t, 'A0DA' )
call UnitRemoveAbility( t, 'B048' )
else
  if r<y then 
  call SaveReal(udg_Hash2,n,5459,r) 
  else
  call SetUnitState( t, UNIT_STATE_LIFE, y )
  endif
  call UnitDamageTarget( u, t, 1.2*i, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
  if GetUnitState(t, UNIT_STATE_LIFE)/GetUnitState(t, UNIT_STATE_MAX_LIFE)<(9+i)*0.01 then
  call UnitDamageTarget( CreateUnit(GetOwningPlayer(u),'n00T',0,0,0), t, 5000, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
  endif
endif
set u=null
set t=null
endfunction


function houxushanghai takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local integer i=LoadInteger(udg_Hash1, n, 2)
local group g=LoadGroupHandle(udg_Hash1,n,1)
local unit t

if i>0 then
call SaveInteger(udg_Hash1,n,2,i-1)
call ForGroup(g,function houxushanghaiact)
else
loop
set t=FirstOfGroup(g)
exitwhen t==null
call UnitRemoveAbility( t, 'A0DA' )
call UnitRemoveAbility( t, 'B048' )
call GroupRemoveUnit(g,t)
set t=null
endloop
call DestroyGroup(g)
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set g=null
set t=null
endfunction



function firstshanghai takes nothing returns nothing
local integer n=GetHandleId( gg_trg_lingdudongjie)
local unit u=LoadUnitHandle(udg_Hash1,n,1)
local unit t=GetEnumUnit()
if IsUnitEnemy(t, GetOwningPlayer(u))==true and GetUnitState(t, UNIT_STATE_LIFE) > 0.00 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0 then
call UnitDamageTarget( u, t, 150+100*GetUnitAbilityLevel(u,'A0D9'), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call SaveReal(udg_Hash2,GetHandleId(t),5459,GetUnitState(t, UNIT_STATE_LIFE)) 
call UnitAddAbility( t, 'A0DA' )
else
call GroupRemoveUnit(LoadGroupHandle(udg_Hash1,n,2),t)
endif
set t=null
set u=null
endfunction



function Trig_lingdudongjie_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer n=GetHandleId(tm)
local unit u=GetTriggerUnit()
local group g=CreateGroup()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()

call UnitApplyTimedLife( CreateUnit(GetTriggerPlayer(),'n006',x,y,0), 'BTLF', 4.00 )
call GroupEnumUnitsInRange(g,x,y,350,null)
call ForGroup(g,function firstshanghai)
call SaveInteger(udg_Hash1,n,2,10*(7+GetUnitAbilityLevel(u,'A0D9')))
call SaveGroupHandle(udg_Hash1,n,1,g)
call SaveGroupHandle(udg_Hash1,GetHandleId( gg_trg_lingdudongjie),2,g)
call TimerStart(tm,0.1,true,function houxushanghai)

set tm=null
set g=null
set u=null
endfunction

//===========================================================================
function InitTrig_lingdudongjie takes nothing returns nothing
    set gg_trg_lingdudongjie = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_lingdudongjie, Condition( function Trig_lingdudongjie_Conditions ) )
    call TriggerAddAction( gg_trg_lingdudongjie, function Trig_lingdudongjie_Actions )
endfunction
