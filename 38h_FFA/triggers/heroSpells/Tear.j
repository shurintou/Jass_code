
//===========================================================================
// Trigger: Tear
//===========================================================================
function Trig_Tear_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A060' 
endfunction

function tearact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=0
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local unit m=LoadUnitHandle(udg_Hash1,i,2)
local integer level=GetUnitAbilityLevel(u,'A060')
local real x=0
local real y=0
local real dx=0
local real dy=0
local real ex=0
local real ey=0
local real r=0 
local real hp=GetUnitState(m, UNIT_STATE_LIFE)

if hp>0 then
set n=LoadInteger(udg_Hash1,i,5)
else
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\SpiritLink\\SpiritLinkZapTarget.mdl", u, "chest") )
call SetUnitState( u, UNIT_STATE_LIFE,  GetUnitState(u, UNIT_STATE_LIFE) + ((0.1+0.1*level)*GetUnitState(m, UNIT_STATE_MAX_LIFE))  )
set n=-1
endif


if n>0 then
set x=LoadReal(udg_Hash1,i,3)
set y=LoadReal(udg_Hash1,i,4)
set dx=GetUnitX(m)
set dy=GetUnitY(m)
set ex=x-dx
set ey=y-dy
set r=SquareRoot(ex * ex + ey * ey)
if r>20 and r<200 then
call UnitDamageTarget( u, m, 0.2*r*level, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", m, "chest") )
endif
call SaveReal(udg_Hash1,i,3,dx)
call SaveReal(udg_Hash1,i,4,dy)
call SaveInteger(udg_Hash1,i,5,n-1)
else
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
set m=null
endfunction

function TearCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local real r=0
local timer tt
local integer m=0
local integer level=0

if UnitHasBuffBJ(t,'BUhf') then
set tt=CreateTimer()
set m=GetHandleId(tt)
set u=LoadUnitHandle(udg_Hash3,i,1)
set level=GetUnitAbilityLevel(u,'A060')
set r=50+100*level
call UnitDamageTarget( u, t, r, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", t, "chest") )
call SaveUnitHandle(udg_Hash1,m,1,u)
call SaveUnitHandle(udg_Hash1,m,2,t)
call SaveReal(udg_Hash1,m,3,GetUnitX(t))
call SaveReal(udg_Hash1,m,4,GetUnitY(t))
call SaveInteger(udg_Hash1,m,5,15+10*level)
call TimerStart(tt,0.2,true,function tearact)
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set tt=null
set u=null
endfunction

function Trig_Tear_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function TearCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_Tear takes nothing returns nothing
    set gg_trg_Tear = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Tear, Condition( function Trig_Tear_Conditions ) )
    call TriggerAddAction( gg_trg_Tear, function Trig_Tear_Actions )
endfunction
