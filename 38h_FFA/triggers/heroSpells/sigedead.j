
//===========================================================================
// Trigger: sigedead
//
// CreateCorpse            takes player whichPlayer, integer unitid, real x, real y, real face returns unit
//===========================================================================
function Trig_sigedead_Conditions takes nothing returns boolean
    return GetUnitAbilityLevel(GetTriggerUnit(),'A0D3')>0 
endfunction



function jiexinacthunpo takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local integer n=LoadInteger(udg_Hash1,i,2)
local unit m=LoadUnitHandle(udg_Hash1,i,4)
local group g
local unit t
local player p
local real r
local integer level=0

if n >0 and GetUnitState(m, UNIT_STATE_LIFE) >0.00 then
  set g=CreateGroup()
  call GroupEnumUnitsInRange(g,GetUnitX(m),GetUnitY(m),600,null)
  set p=GetOwningPlayer(u)
  set level=GetUnitAbilityLevel(u,'A0D3')
  set r=3*level+0.03*GetHeroInt(u,true)
  loop
  set t=FirstOfGroup(g)
  exitwhen t==null
    if IsUnitEnemy(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) > 0.00 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0  then
    call UnitDamageTarget( u, t, r*GetUnitState(t, UNIT_STATE_MAX_LIFE)*0.01, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl", t, "origin") )
    endif
  call GroupRemoveUnit(g,t)
  set t=null
  endloop
call DestroyGroup(g)
call SaveInteger(udg_Hash1,i,2,n-1)
else
call DestroyEffect(LoadEffectHandle(udg_Hash1,i,3))
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set u=null
set g=null
set t=null
set p=null
set tm=null
set m=null
endfunction



function Trig_sigedead_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m=CreateUnit(GetTriggerPlayer(),'ushd',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)

call SetUnitAnimationByIndex( m, 4 )
call SelectUnitForPlayerSingle( m, GetTriggerPlayer() )
call UnitApplyTimedLife( m, 'BTLF', 5.50 )
call SetUnitMoveSpeed( m, GetUnitMoveSpeed(u) )
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveEffectHandle(udg_Hash1,i,3,AddSpecialEffectTarget("Abilities\\Spells\\Undead\\Unsummon\\UnsummonTarget.mdl", m, "origin") )
call SaveInteger(udg_Hash1,i,2,5)
call SaveUnitHandle(udg_Hash1,i,4,m)
call TimerStart(tm,1,true,function jiexinacthunpo)
call SaveInteger(udg_Hash1,GetHandleId(gg_trg_sigedead),1,1+LoadInteger(udg_Hash1,GetHandleId(gg_trg_sigedead),1))
set tm=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_sigedead takes nothing returns nothing
    set gg_trg_sigedead = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_sigedead, Condition( function Trig_sigedead_Conditions ) )
    call TriggerAddAction( gg_trg_sigedead, function Trig_sigedead_Actions )
endfunction
