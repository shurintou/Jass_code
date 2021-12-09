
//===========================================================================
// Trigger: falikuikong
//===========================================================================
function Trig_falikuikong_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08S' 
endfunction

function amharm takes unit u,real x,real y,real l,real h returns nothing
local group g=CreateGroup()
local unit t
call GroupEnumUnitsInRange(g,x,y,325,null)
     loop
      set t = FirstOfGroup(g)   
      exitwhen t==null 
       call GroupRemoveUnit(g,t) 
       if GetUnitState(t, UNIT_STATE_LIFE) > 0.00 ==true and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0 and IsUnitEnemy(t, GetOwningPlayer(u))  then
           call UnitDamageTarget( u, t, h, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
           call DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\DragonHawkMissile\\DragonHawkMissile.mdl", t, "chest") )
          endif
         endloop
call DestroyGroup(g)
set g=null
set t=null
endfunction


function AMCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local unit m
local real r
local integer level

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash3,i,1)
set m=CreateUnit(GetOwningPlayer(u),'n001',0,0,0)
call UnitAddAbility(m,'A056')
set r=GetUnitState(t, UNIT_STATE_MAX_MANA)-GetUnitState(t, UNIT_STATE_MANA)
set level=GetUnitAbilityLevel(u,'A08S' )
call IssueTargetOrderById( m, 852095, t )
call amharm(u,GetUnitX(t),GetUnitY(t),325,r*(0.35+(0.25*level)))
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
else
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
set m=null
endfunction




function Trig_falikuikong_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function AMCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_falikuikong takes nothing returns nothing
    set gg_trg_falikuikong = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_falikuikong, Condition( function Trig_falikuikong_Conditions ) )
    call TriggerAddAction( gg_trg_falikuikong, function Trig_falikuikong_Actions )
endfunction
