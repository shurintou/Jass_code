
//===========================================================================
// Trigger: BlinkAttack
//===========================================================================
function Trig_BlinkAttack_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04W' 
endfunction

function wblink takes nothing returns nothing
local timer tt=GetExpiredTimer()
local integer m=GetHandleId(tt)
local unit u=LoadUnitHandle(udg_Hash3,m,1)
local unit t=LoadUnitHandle(udg_Hash3,m,2)
local real x=GetUnitX(t)
local real y=GetUnitY(t)

if UnitHasBuffBJ(t,'BUhf') then
call SetUnitX(u,x)
call SetUnitY(u,y)
call IssueTargetOrderById( u, 851983, t )
call UnitDamageTarget( u, t, 30*GetUnitAbilityLevel(u, 'A04W'), true, false,ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, m )
call PauseTimer(tt)
call DestroyTimer(tt)

set tt=null
set t=null
set u=null
endfunction



function Trig_BlinkAttack_Actions takes nothing returns nothing
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
call TimerStart(tm,0.01,false,function wblink)
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
function InitTrig_BlinkAttack takes nothing returns nothing
    set gg_trg_BlinkAttack = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_BlinkAttack, Condition( function Trig_BlinkAttack_Conditions ) )
    call TriggerAddAction( gg_trg_BlinkAttack, function Trig_BlinkAttack_Actions )
endfunction
