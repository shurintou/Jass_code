
//===========================================================================
// Trigger: UseItem
//
// 虽说是使用物品，但仍然以发动技能效果为事件
// 现在以udg_Hash3为物品哈希表，单位指针ID为主索引，子索引从10开始
// 2：XF的怒意狂击
// 6：相位
// 10：BKB
// 11：臂章的Timer
// 19：洛萨杖
// 940：最后接受伤害的来源，用来判断凶手 //call SaveInteger(udg_Hash3,GetHandleId(u),940,i)没用了现在
// 641：X标记的Timer
// 597：奔腾的Timer
// 619：薄葬BOlean
// 332：英雄的小技能///333：英雄的大招
// 653：巫医的巫毒守卫
// 412：刃甲的timer
// 4923：雷锤BUFF的归属单位
// 4924：雷锤TIMER
// 9999:跳刀
// loop
// exitwhen i>5
// if GetItemTypeId(UnitItemInSlot(u, i)) == 'I01D' then
// set n=i
// set i=10
// else
// set i=i+1
// endif
// endloop
//===========================================================================
function bkb takes nothing returns nothing
local timer tm=GetExpiredTimer()
local unit u
local integer i=GetHandleId(tm)
local integer m=0
local integer n=LoadInteger(udg_Hash3,i,1)
local real r

if n !=0 then
call SaveInteger(udg_Hash3,i,1,n-1)
else
set u=LoadUnitHandle(udg_Hash3,i,2)
set r=LoadReal(udg_Hash2,GetHandleId(u),10001)
call UnitRemoveAbility(u,'A02A')
call PauseTimer(tm)
call DestroyTimer(tm)
call FlushChildHashtable( udg_Hash3, i )
call SetUnitScale( u, r, r, r )
endif

set tm=null
set u=null
endfunction


function BlackKingBar takes unit u returns nothing
local integer i=GetHandleId(u)
local integer n=0
local timer tm=LoadTimerHandle(udg_Hash3,i,10)
local integer m=GetUnitTypeId(u)
local real r

call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Avatar\\AvatarCaster.mdl", u, "origin") )
call UnitAddAbility(u,'A02A')
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A02A', false )
if tm !=null then
call SaveInteger(udg_Hash3,GetHandleId(tm),1,10)
else
set tm=CreateTimer()
set n=GetHandleId(tm)
call SaveTimerHandle(udg_Hash3,i,10,tm)//绑定在单位身上索引为10的BKB的timer
call SaveInteger(udg_Hash3,n,1,10)//绑定在计时器上的计数，每秒减1
call SaveUnitHandle(udg_Hash3,n,2,u)//绑定单位到计时器上，删除魔免
//if m=='Hvwd' or m=='Orex' or m=='Ekgg' or m=='Ocbh' then
//call SetUnitScale( u, 2.5, 2.5, 2.5 )
//else
//call SetUnitScale( u, 1.7, 1.7, 1.7 )
//endif
set r=LoadReal(udg_Hash2,GetHandleId(u),10001)+0.4
call SetUnitScale( u, r, r, r )
call TimerStart(tm,1,true,function bkb)
endif

set tm=null
endfunction


function FrozenArmatrue takes unit u returns nothing
local integer i=0
local real x
local real y
local real pia=3.1415926
local unit m
    
     set x=GetUnitX(u)
     set y=GetUnitY(u) 
     set m=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)
     call SetUnitScale( m, 3.00, 3.00, 3.00 )
     call UnitAddAbility(m,'A018')
     call UnitAddAbility(m,'A02C')
     call UnitAddAbility(m,'A02D')
     call SetUnitExploded( m, true )
     call HarmGroup(u,1000,200)
     call IssueImmediateOrderById( m, 852526 )
     call UnitApplyTimedLife( m, 'BHwe', 2.5 )
loop
exitwhen i>12
set i=i+1
call IssuePointOrderById( m, 852125, x+(100*(Cos(30*i)*pia)), y+(100*(Sin(30*i)*pia)) )
endloop 

set m=null
endfunction


function stopcrash takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer m=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash3,m,1)
local integer i=0
local integer n=0
local item t=LoadItemHandle(udg_Hash3,m,2)
local integer ngl=LoadInteger(udg_Hash3,m,111)

if ngl>0 then
call SaveInteger(udg_Hash3,m,111,ngl-1)
else
call UnitRemoveAbility( u, 'B00R' )
call SetUnitPathing( u, true )
  if GetUnitState(u, UNIT_STATE_LIFE) > 0 and IsUnitType(u, UNIT_TYPE_POLYMORPHED)==false and IsUnitLoaded(u)==false and GetUnitAbilityLevel(u,'BNdo')==0 and GetUnitAbilityLevel(u,'B02I')==0 and IsUnitPaused(u) == false then
  loop
  exitwhen i>5
      if GetItemTypeId(UnitItemInSlot(u, i)) == 'I01D' then
      set n=i
      set i=10
      else
      set i=i+1
      endif
  endloop
  call RemoveItem( UnitItemInSlot(u, n) )
  call SetItemVisible( t, true )
  call UnitAddItemToSlotById( u, 'tmmt', n )
  call RemoveItem(t)
  call PauseTimer(tm)
  call FlushChildHashtable( udg_Hash3, m )
  call DestroyTimer(tm)
  else
  call SaveInteger(udg_Hash3,m,111,1)
  endif
endif

set tm=null
set u=null
set t=null
endfunction

function moveinnocrash takes unit u returns nothing
local timer tm=CreateTimer()
local item t
local integer i=0
local integer n=0
local integer tti=GetHandleId(tm)
loop
exitwhen i>5
if GetItemTypeId(UnitItemInSlot(u, i)) == 'tmmt' then
set n=i
set i=10
else
set i=i+1
endif
endloop
set t=UnitItemInSlot(u, n)
call SetUnitPathing( u, false )
call UnitRemoveItemFromSlot( u, n )
call SetItemVisible( t, false )
call UnitAddItemToSlotById( u, 'I01D', n )
call SaveTimerHandle(udg_Hash3,GetHandleId(u),6,tm)
call SaveUnitHandle(udg_Hash3,tti,1,u)
call SaveItemHandle(udg_Hash3,tti,2,t)
call SaveInteger(udg_Hash3,tti,111,5)
call TimerStart(tm,1,true,function stopcrash)

set t=null
set tm=null
endfunction

function renjiaact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local unit u
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash3,i,1)

if n>0 then
call SaveInteger(udg_Hash3,i,1,n-1)
else
set u=LoadUnitHandle(udg_Hash3,i,2)
call UnitRemoveAbility(u,'A07E')
call UnitRemoveAbility(u,'B02G')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
endfunction



function swordhammer takes unit u returns nothing
local integer i=GetHandleId(u)
local integer n=0
local timer tm=LoadTimerHandle(udg_Hash3,i,412)

if GetUnitAbilityLevel(u,'B02G')>0 then
call SaveInteger(udg_Hash3,GetHandleId(tm),1,50)
else
set tm=CreateTimer()
set n=GetHandleId(tm)
call SaveTimerHandle(udg_Hash3,i,412,tm)
call SaveInteger(udg_Hash3,n,1,50)
call SaveUnitHandle(udg_Hash3,n,2,u)
call UnitAddAbility(u,'A07E')
call TimerStart(tm,0.1,true,function renjiaact)
endif

set tm=null
//local unit m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(u),GetUnitY(u),0)
//call UnitAddAbility( m, 'Aspp' )
//call IssueTargetOrderById( m, 854299, u )
//call IssueTargetOrder( m, "spiritlink", u )
//call IssueTargetOrder( m, "spiritlinkaoe", u )
//call UnitApplyTimedLife( m, 'BTLF', 5.00 )
//set m=null
endfunction

function XLCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit m
local unit u
local integer agi=0

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash3,i,1)
set agi=GetHeroAgi(u, true)
set m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(t),GetUnitY(t),0)
call UnitAddAbility( m, 'A02H' )
call IssueTargetOrderById( m, 852486, t )
call UnitDamageTarget( u, t, 2.5*agi, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\AncientsWrath.mdx", t, "chest") )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
else
endif

call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set m=null
set u=null
endfunction

function xulingdun takes unit u,unit t returns nothing
local integer agi=GetHeroAgi(u, true)
local unit m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(t),GetUnitY(t),0)
local timer tm
local integer i=0


if IsUnitEnemy(t, GetOwningPlayer(u)) == true then
set tm=CreateTimer()
set i=GetHandleId(tm)
call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,u)
call TimerStart(tm,0.01,false,function XLCheckLinkin)
else
call UnitAddAbility( m, 'ACbn' )
call IssueTargetOrderById( m, 852486, t )
call SetUnitState( t, UNIT_STATE_LIFE, GetUnitState(t, UNIT_STATE_LIFE) + (2.5*agi)  )
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\AncientsWrath.mdx", t, "chest") )
if u==t then
call SetUnitState( t, UNIT_STATE_LIFE, GetUnitState(t, UNIT_STATE_LIFE) + (1.5*agi)  )
endif
endif
call UnitApplyTimedLife( m, 'BTLF', 5.00 )

set m=null
set tm=null
endfunction

function minushp takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash3,GetHandleId(GetExpiredTimer()),1)
if GetUnitState(u, UNIT_STATE_LIFE)>35 then
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE) - 35  )
else
call SetUnitState( u, UNIT_STATE_LIFE, 1  )
endif
set u=null
endfunction


function armopen takes unit u returns nothing
local timer tm=CreateTimer()
local integer i=0
local integer n=0

call DisableTrigger( gg_trg_UseItem )
loop
exitwhen i>5
if GetItemTypeId(UnitItemInSlot(u, i)) == 'frhg' then
set n=i
set i=10
else
set i=i+1
endif
endloop
call RemoveItem(UnitItemInSlot(u, n))
call UnitAddItemToSlotById( u, 'gvsm', n )
call UnitUseItem( u, UnitItemInSlot(u, n) )
call SaveTimerHandle(udg_Hash3,GetHandleId(u),11,tm)
call SaveUnitHandle(udg_Hash3,GetHandleId(tm),1,u)
call SaveInteger(udg_Hash3,GetHandleId(tm),2,n)
call TimerStart(tm,1,true,function minushp)
call SetHeroStr( u, ( GetHeroStr(u, false) + 25 ), true )
call EnableTrigger( gg_trg_UseItem )

set tm=null
endfunction

function armclose takes unit u returns nothing
local timer tm=LoadTimerHandle(udg_Hash3,GetHandleId(u),11)
local integer m=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash3,m,2)

call SetHeroStr( u, ( GetHeroStr(u, false) - 25 ), true )
call RemoveItem(UnitItemInSlot(u, n))
call UnitAddItemToSlotById( u, 'frhg', n )
call PauseTimer(tm)
call FlushChildHashtable( udg_Hash3, m )
call DestroyTimer(tm)

set tm=null
endfunction

function DarkSummon takes unit u ,real x,real y returns nothing
local integer i=0
local unit m
local player p=GetOwningPlayer(u)
local real dx=GetUnitX(u)
local real dy=GetUnitY(u)


loop
exitwhen i>11
if IsPlayerAlly(p, Player(i)) and p!=Player(i) then
set m=CreateUnit(Player(i),'n001',dx,dy,0)
call UnitAddAbility( m, 'AUds' )
call IssuePointOrderById( m, 852220, x, y )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
endif
set i=i+1
endloop

set m=null
set p=null
endfunction

function Sacrifice takes unit u returns nothing
local real h=GetUnitState(u, UNIT_STATE_LIFE)
if h> 150.00 then
call SetUnitState( u, UNIT_STATE_LIFE, h-150 )
else
call SetUnitState( u, UNIT_STATE_LIFE, 1 )
endif
endfunction

function MagicBar takes unit u returns nothing
local integer i=0
local integer n=0
local item e

loop
exitwhen i>=6 
set e=UnitItemInSlot(u, i)
if GetItemTypeId(e)=='wlsd' then
set n=GetItemCharges(e)*15
call SetItemCharges(e,0)
set i=6
endif
set i=i+1
endloop
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+n )
call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA)+n )

set e=null
endfunction

function lingkan takes unit u ,unit target returns nothing
local player p=GetOwningPlayer(u)
local unit m=CreateUnit(p,'n001',0,0,0)

call UnitAddAbility(m,'ANmr')
if IsUnitEnemy(target, p)==true then
call SetUnitAbilityLevel(m,'ANmr',2)
endif
call UnitApplyTimedLife( m, 'BTLF', 5 )
call IssueTargetOrder( m, "mindrot", target )

set p=null
set m=null
endfunction

function removeluosa takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash3,i,2)
local unit u=LoadUnitHandle(udg_Hash3,i,1)

//if GetUnitAbilityLevel(u,'Binv')>0 then
//else
//call UnitRemoveAbility(u,'A03Q')
//call UnitRemoveAbility(u,'A03P')
//call UnitRemoveAbility(u,'A03N')
//call UnitRemoveAbility( u, 'B018' )
//endif


if n>0 and GetUnitAbilityLevel(u,'A03N')>0 and GetUnitAbilityLevel(u,'Binv')>0 then
call SaveInteger(udg_Hash3,i,2,n-1)
else
call SaveTimerHandle(udg_Hash3,GetHandleId(u),19,null)
call UnitRemoveAbility(u,'A03Q')
call UnitRemoveAbility(u,'A03P')
call UnitRemoveAbility(u,'A03N')
call UnitRemoveAbility( u, 'B018' )
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
endfunction

function luosa takes unit u returns nothing
local player p=GetOwningPlayer(u)
local unit m=CreateUnit(p,'n001',0,0,0)
local integer i=0
local integer n=GetHandleId(u)
local timer tm=LoadTimerHandle(udg_Hash3,n,19)

if tm!=null then
set i=GetHandleId(tm)
call SaveInteger(udg_Hash3,i,2,9)
else
set tm=CreateTimer()
set i=GetHandleId(tm)
call SaveTimerHandle(udg_Hash3,n,19,tm)
call SaveUnitHandle(udg_Hash3,i,1,u)
call SaveInteger(udg_Hash3,i,2,9)
call TimerStart(tm,1,true,function removeluosa)
endif
call UnitAddAbility(m,'Aivs')
call UnitAddAbility(u,'A03Q')
call SetPlayerAbilityAvailable( p, 'A03Q', false )
call UnitApplyTimedLife( m, 'BTLF', 5 )
call IssueTargetOrderById( m, 852069, u )
call IssueTargetOrder( m, "invisibility", u )
set tm=null
set m=null
set p=null
endfunction


function kajiab takes nothing returns boolean
return IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true
endfunction

function kajia takes unit u returns nothing
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local group g=CreateGroup()
local boolexpr b
local unit m
local unit t=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)

call UnitAddAbility( t, 'Aam2' )
call UnitApplyTimedLife( t, 'BTLF', 3 )
set b=Condition(function kajiab)
set udg_lsu=u
call GroupEnumUnitsInRange(g,x,y,700,b) 
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call IssueTargetOrderById( t, 852186, m )
call GroupRemoveUnit(g,m)
endloop
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)

set t=null
set g=null
set b=null
set m=null
endfunction

function qiehuan takes unit u returns nothing
local integer i=0
local item e
local integer n=0

loop
exitwhen i>5
set e=UnitItemInSlot(u, i)
if GetItemTypeId(e)=='sor5' then
call RemoveItem( e )
call UnitAddItemToSlotById( u, 'I02Y', i )
set i=6
set n=1
endif
set i=i+1
endloop

set i=0

loop
exitwhen i>5 or n==1
set e=UnitItemInSlot(u, i)
if GetItemTypeId(e)=='I02Y' then
call RemoveItem( e )
call UnitAddItemToSlotById( u, 'sor5', i )
set i=6
set n=1
endif
set i=i+1
endloop

set e=null
endfunction


function silingshu takes unit u returns nothing
local unit m
local player p=GetOwningPlayer(u)
local real x=GetUnitX(u)
local real y=GetUnitY(u)

if ciwh(u,'tfar')>=1 then
set m=CreateUnit(p,'hwt3',x,y,270)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\RaiseSkeletonWarrior\\RaiseSkeleton.mdl", m, "origin") )
call UnitApplyTimedLife( m, 'BTLF', 35.00 )
call SetUnitAbilityLevel( m, 'A07J', 3 )
call SetUnitAbilityLevel( m, 'Afbk', 3 )
set m=CreateUnit(p,'osw3',x,y,270)
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\HolyStrike.mdx", m, "origin") )
call UnitApplyTimedLife( m, 'BTLF', 35.00 )
call SetUnitAbilityLevel( m, 'Afbk', 3 )
else
if ciwh(u,'tbar')>=1 then
set m=CreateUnit(p,'hwt2',x,y,270)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\RaiseSkeletonWarrior\\RaiseSkeleton.mdl", m, "origin") )
call UnitApplyTimedLife( m, 'BTLF', 35.00 )
call SetUnitAbilityLevel( m, 'A07J', 2 )
call SetUnitAbilityLevel( m, 'Afbk', 2 )
set m=CreateUnit(p,'osw2',x,y,270)
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\HolyStrike.mdx", m, "origin") )
call UnitApplyTimedLife( m, 'BTLF', 35.00 )
call SetUnitAbilityLevel( m, 'Afbk', 2 )
else
set m=CreateUnit(p,'hwat',x,y,270)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\RaiseSkeletonWarrior\\RaiseSkeleton.mdl", m, "origin") )
call UnitApplyTimedLife( m, 'BTLF', 35.00 )
call SetUnitAbilityLevel( m, 'A07J', 1 )
call SetUnitAbilityLevel( m, 'Afbk', 1 )
set m=CreateUnit(p,'osw1',x,y,270)
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\HolyStrike.mdx", m, "origin") )
call UnitApplyTimedLife( m, 'BTLF', 35.00 )
call SetUnitAbilityLevel( m, 'Afbk', 1 )
endif
endif


set m=null
set p=null
endfunction

function xunzhang takes unit u,unit t returns nothing
local unit m=CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE),'h008',GetUnitX(u),GetUnitY(u),0)
call UnitApplyTimedLife( m, 'BHwe',0.3)
call IssueTargetOrderById( m, 851983, u )
set m=CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE),'h008',GetUnitX(t),GetUnitY(t),0)
call UnitApplyTimedLife( m, 'BHwe',0.3)
call IssueTargetOrderById( m, 851983, t )
set m=null
endfunction


function tanshemove takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash3, n, 1)
local integer i=LoadInteger(udg_Hash3, n, 2)
local real c=LoadReal(udg_Hash3, n, 3)
local real s=LoadReal(udg_Hash3, n, 4)
local real x
local real y
local unit m

if i<16 then
set m=CreateUnit(GetOwningPlayer(u),'n001',0,0,0)
set i=i+1
set x=GetUnitX(u)+(50*c)
set y=GetUnitY(u)+(50*s)
call SetUnitX(u,x)
call SetUnitY(u,y)
call UnitAddAbility( m, 'A0BB' )
call UnitApplyTimedLife( m, 'BTLF', 1.5 )
call IssuePointOrderById( m, 852221, x,y)
call SaveInteger(udg_Hash3,n,2,i)
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\FlakCannons\\FlakTarget.mdl", x, y) )
else
call FlushChildHashtable( udg_Hash3, n )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set u=null
set tm=null
set m=null
endfunction


function tanshe takes unit u returns nothing
local real r=GetUnitFacing(u)*3.1415/180
local real c=Cos(r)
local real s=Sin(r)
local timer tm=CreateTimer()
local integer n=GetHandleId(tm)





call SaveUnitHandle(udg_Hash3,n,1,u)
call SaveInteger(udg_Hash3,n,2,0)
call SaveReal(udg_Hash3,n,3,c)
call SaveReal(udg_Hash3,n,4,s)
call TimerStart(tm,0.02,true,function tanshemove)

set tm=null
endfunction

function removeleishen takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local unit u
local integer i=LoadInteger(udg_Hash3, n, 3)

if i>0 then
call SaveInteger(udg_Hash3,n,3,i-1)
else
set u=LoadUnitHandle(udg_Hash3, n, 1)
call UnitRemoveAbility( u, 'A0AA' )
call UnitRemoveAbility( u, 'B03F' )
call FlushChildHashtable( udg_Hash3, n )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set u=null
set tm=null
endfunction


function leishenzhichui takes unit u,unit t returns nothing
local integer n=GetHandleId(t)
local timer tm=LoadTimerHandle(udg_Hash3,n,4924)
local integer i
if tm==null then
set tm=CreateTimer()
set i=GetHandleId(tm)
call SaveTimerHandle(udg_Hash3,n,4924,tm)
call SaveInteger(udg_Hash3,i,3,20)
call SaveUnitHandle(udg_Hash3,i,1,t)
call TimerStart(tm,1,true,function removeleishen)
else
call SaveInteger(udg_Hash3,GetHandleId(tm),3,20)
endif
call SaveUnitHandle(udg_Hash3,n,4923,u)
call UnitAddAbility( t, 'A0AA' )
set tm=null
endfunction


function removejinzhongzhao takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash3, n, 1)

call SetUnitTimeScale( u, 1 )
call SetUnitInvulnerable( u, false )
call PauseUnit( u, false )
call DestroyEffect( LoadEffectHandle(udg_Hash3, n, 2) )
call FlushChildHashtable( udg_Hash3, n )
call PauseTimer(tm)
call DestroyTimer(tm)

set u=null
set tm=null
endfunction


function jinzhongzhao takes unit u returns nothing
local timer tm=CreateTimer()
local integer n=GetHandleId(tm)





call SaveUnitHandle(udg_Hash3,n,1,u)
call SaveEffectHandle(udg_Hash3,n,2,AddSpecialEffectTarget("Abilities\\Spells\\Human\\DivineShield\\DivineShieldTarget.mdl", u, "origin"))
call SetUnitInvulnerable( u, true )
call PauseUnit( u, true )
call SetUnitTimeScale( u, 0 )
call TimerStart(tm,5,false,function removejinzhongzhao)

set tm=null
endfunction

function Trig_UseItem_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i=GetSpellAbilityId()
    call UnitRemoveAbility(u,'A03Q')//每次使用技能直接把洛萨的攻击特效删掉
    call UnitRemoveAbility( u, 'B018' )
    if  i == 'AIxs'  then//黑皇1
    call BlackKingBar(u)
    else
    if  i == 'A01D'  then//希瓦2
    call FrozenArmatrue(u)
    else
    if  i == 'A01L'  then//刷新3
    call UnitResetCooldown(u)
    else
    if i == 'APsa'  then//相位4
    call moveinnocrash(u)
    else
    if  i == 'A019'  then//刃甲5
    call swordhammer(u)
    else
    if  i == 'A02I'  then//虚灵盾6
    call xulingdun(u,GetSpellTargetUnit())
    else
    if  i == 'A02K'  then//臂章开7
    call armopen(u)
    else
    if  i == 'A02L'  then//臂章关8
    call armclose(u)
    else
    if  i == 'A030'  then//黑暗召唤9
    call DarkSummon(u,GetSpellTargetX(),GetSpellTargetY())
    else
    if  i == 'AIm1'  then//牺牲10
    call Sacrifice(u)
    else
    if  i == 'A031'  then//魔棒11
    call MagicBar(u)
    else
    if  i == 'A03H'  then//灵龛12
    call lingkan(u,GetSpellTargetUnit())
    else
    if  i == 'A020'  then//洛萨13
    call luosa(u)
    else
    if  i == 'A04Z'  then//笛子14
    call kajia(u)
    else
    if  i == 'A063'  then//震魂爪/克敌机先15
    call qiehuan(u)
    else
    if  i == 'A07M'  then//死灵书16
    call silingshu(u)
    else
    if  i == 'A0A4'  then//勇气勋章17
    call xunzhang(u,GetSpellTargetUnit())
    else
    if  i == 'A07O'  then//弹射18
    call tanshe(GetSpellTargetUnit())
    else
    if  i == 'A0AB'  then//雷锤19
    call leishenzhichui(u,GetSpellTargetUnit())
    else
    if  i=='AIpx' then//20时光
    call UnitAddAbility( u, 'A0DL' )
    call SetUnitAbilityLevel( u, 'A0DL', 2 )
    call UnitRemoveAbility( u, 'A0DL' )
    call SetHeroInt( u, GetHeroInt(u, false)+4, true )
    else
    if  i=='A0DO' then//金钟罩21
    call jinzhongzhao(u)
    else
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif  
    endif
    endif
    //endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_UseItem takes nothing returns nothing
    set gg_trg_UseItem = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_UseItem, Condition( function Trig_UseItem_Conditions ) )
endfunction
