
//===========================================================================
// Trigger: BlinkBack
//===========================================================================
function Trig_BlinkBack_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08U' 
endfunction


function bblink takes nothing returns nothing
local timer tt=GetExpiredTimer()
local integer m=GetHandleId(tt)
local unit u=LoadUnitHandle(udg_Hash3,m,1)
local unit t=LoadUnitHandle(udg_Hash3,m,2)
local real x=GetUnitX(t)
local real y=GetUnitY(t)
local real agi=GetHeroAgi(u, true)
local integer level=GetUnitAbilityLevel(u, 'A05Z' )
local real rate=0.25+0.25*level


if UnitHasBuffBJ(t,'BUhf') then
call SetUnitX(u,x)
call SetUnitY(u,y)
call IssueTargetOrderById( u, 851983, t )
call UnitDamageTarget( u, t, agi*rate, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", t, "chest") )
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, m )
call PauseTimer(tt)
call DestroyTimer(tt)

set tt=null
set t=null
set u=null
endfunction



function Trig_BlinkBack_Actions takes nothing returns nothing

local timer tm
local integer i=0
local unit t=GetSpellTargetUnit()
local unit u=GetTriggerUnit()
local real x=GetUnitX(t)
local real y=GetUnitY(t)
local unit m

if IsUnitEnemy(t, GetTriggerPlayer()) == true then
set m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
set tm=CreateTimer()
set i=GetHandleId(tm)
call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,u)
call TimerStart(tm,0.01,false,function bblink)
else
call SetUnitX(u,x)
call SetUnitY(u,y)
endif

set tm=null
set t=null
set m=null
set u=null

endfunction

//===========================================================================
function InitTrig_BlinkBack takes nothing returns nothing
    set gg_trg_BlinkBack = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_BlinkBack, Condition( function Trig_BlinkBack_Conditions ) )
    call TriggerAddAction( gg_trg_BlinkBack, function Trig_BlinkBack_Actions )
endfunction
