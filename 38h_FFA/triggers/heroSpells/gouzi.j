
//===========================================================================
// Trigger: gouzi
//
// 向一个地点投掷血腥的肉钩，肉钩将把所接触到的第一个单位钩回屠夫身边。如果这是一个敌方单位，会造成神圣（英雄攻击·魔法伤害）伤害。 
// 等级1 - 射程600，如果钩中敌方单位，造成90点的伤害。
// 等级2 - 射程800，如果钩中敌方单位，造成180点的伤害。
// 等级3 - 射程1000，如果钩中敌方单位，造成270点的伤害。
// 等级4 - 射程1200，如果钩中敌方单位，造成360点的伤害。
// 等级1: 魔法消耗110点，施法间隔14秒。
// 等级2: 魔法消耗120点，施法间隔13秒。
// 等级3: 魔法消耗130点，施法间隔12秒。
// 等级4: 魔法消耗140点，施法间隔11秒。
//===========================================================================
function Trig_gouzi_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08N' 
endfunction



function huge takes nothing returns boolean
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetFilterUnit()!=udg_lsu and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) ==false and GetUnitTypeId(GetFilterUnit()) != 'e000' and GetUnitTypeId(GetFilterUnit()) != 'Hdgo' and IsUnitType(GetFilterUnit(), UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0
endfunction



function gouzigg takes unit t,unit u returns nothing//伤害函数
if IsUnitEnemy(t, GetOwningPlayer(u)) == true then
call UnitDamageTarget( u, t, 90*GetUnitAbilityLevel(u,'A08N'), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodPeasant.mdl", t, "chest") )
endif
endfunction


function checkgroup takes group g,integer n returns nothing
local unit m
if IsUnitGroupEmptyBJ(g)==true then
else
set m=FirstOfGroup(g)
call gouzigg(m,LoadUnitHandle(udg_Hash1,n,666))
call SaveUnitHandle(udg_Hash1,n,0,m)//0是被钩到的单位
call SaveInteger(udg_Hash1,n,654,0)//钩到人了
endif
set m=null
endfunction


function goudaoren takes integer n,integer l returns integer
local unit m=LoadUnitHandle(udg_Hash1,n,l)
local unit t

if LoadInteger(udg_Hash1,n,654)==1 then//没钩到人但是钩长度到了
else
set t=LoadUnitHandle(udg_Hash1,n,0)
call SelectUnitRemove( t )
call IssueImmediateOrderById( t, 851972 )
call SetUnitX(t,GetUnitX(m))
call SetUnitY(t,GetUnitY(m))
endif
call ShowUnit( m, false )
call KillUnit(m)
call RemoveUnit(m)
call SaveInteger(udg_Hash1,n,678,l-1)



if l==1 then
set m=null
set t=null
return 0
else
set m=null
set t=null
return 1
endif
endfunction


function movehug takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local unit m
local unit t
local integer i=LoadInteger(udg_Hash1, n, 888)//888是运行所需次数
local real angle
local integer l=LoadInteger(udg_Hash1, n, 678)
local real c
local real s
local real x
local real y
local group g
local boolexpr b
local integer p

if l<i and LoadInteger(udg_Hash1,n,654)==1 and LoadInteger(udg_Hash1,n,999)==1 then//若654不是1则意味着钩到人了，返回
set g=CreateGroup()
set angle=LoadReal(udg_Hash1, n, 695)
set b=Condition(function huge)
set t=LoadUnitHandle(udg_Hash1,n,l)
set c=Cos(angle)
set s=Sin(angle)
set x=RealX(GetUnitX(t)+(40*c))
set y=RealY(GetUnitY(t)+(40*s))
set m=CreateUnit(Player(0),'n00N',x,y,angle*bj_RADTODEG)
call SaveInteger(udg_Hash1,n,678,l+1)
call SaveUnitHandle(udg_Hash1,n,l+1,m)
set udg_lsu=LoadUnitHandle(udg_Hash1,n,666)
call GroupEnumUnitsInRange(g,x,y,150,b)
call checkgroup(g,n)
call DestroyGroup(g)
call DestroyBoolExpr(b)
else
call SaveInteger(udg_Hash1,n,999,0)
set p=goudaoren(n,l)
endif

if p==0 then
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)
endif
set t=null
set g=null
set b=null
set tm=null
set m=null
endfunction


function Trig_gouzi_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real sx=GetSpellTargetX()
local real sy=GetSpellTargetY()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real angle=Atan2(sy-y, sx-x)
local unit m
local real c=Cos(angle)
local real s=Sin(angle)
local timer tm=CreateTimer()
local integer n=GetHandleId(tm)
local integer level=GetUnitAbilityLevel(u,'A08N')



set m=CreateUnit(Player(0),'n00N',x,y,angle*bj_RADTODEG)
call SaveUnitHandle(udg_Hash1,n,666,u)//放钩子的单位
call SaveUnitHandle(udg_Hash1,n,1,m)//第一个单位
call SaveInteger(udg_Hash1,n,888,10+5*level)//888是运行次数
call SaveReal(udg_Hash1,n,695,angle)//695是角度
call SaveInteger(udg_Hash1,n,678,1)//678是运行到的位置
call SaveInteger(udg_Hash1,n,654,1)
call SaveInteger(udg_Hash1,n,999,1)
call TimerStart(tm,0.04,true,function movehug)


set m=null
set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_gouzi takes nothing returns nothing
    set gg_trg_gouzi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_gouzi, Condition( function Trig_gouzi_Conditions ) )
    call TriggerAddAction( gg_trg_gouzi, function Trig_gouzi_Actions )
endfunction
