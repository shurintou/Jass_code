
//===========================================================================
// Trigger: HuanXiangLa
//===========================================================================
function Trig_HuanXiangLa_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06Q' 
endfunction


function HXTCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local group g
local unit m
local player p
local real x
local real y

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash3,i,1)
set g=CreateGroup()
set p=GetOwningPlayer(u)
set x=GetUnitX(t)
set y=GetUnitY(t)
call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),1400,null) 
call SetUnitX(u,x)
call SetUnitY(u,y)
call IssueTargetOrderById( u, 851983, t )
call UnitDamageTarget( u, t, GetHeroAgi(u,true), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
loop
set m=FirstOfGroup(g)
exitwhen m==null
  if IsUnitIllusion(m) and GetOwningPlayer(m)==p then
  call SetUnitX(m,x)
  call SetUnitY(m,y)
  call IssueTargetOrderById( m, 851983, t )
  endif
call GroupRemoveUnit(g,m)
set m=null
endloop
call DestroyGroup(g)
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
set g=null
set m=null
set p=null
endfunction


function Trig_HuanXiangLa_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function HXTCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_HuanXiangLa takes nothing returns nothing
    set gg_trg_HuanXiangLa = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HuanXiangLa, Condition( function Trig_HuanXiangLa_Conditions ) )
    call TriggerAddAction( gg_trg_HuanXiangLa, function Trig_HuanXiangLa_Actions )
endfunction
