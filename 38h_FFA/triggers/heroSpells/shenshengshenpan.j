
//===========================================================================
// Trigger: shenshengshenpan
//===========================================================================
function Trig_shenshengshenpan_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0C9' 
endfunction

function chestlinkenshenpan takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash1,i,2)
local unit u
local integer n
local integer level
local real r
local real f

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash1,i,1)
set n=GetPlayerScore(GetOwningPlayer(t), PLAYER_SCORE_HEROES_KILLED)
set level=GetUnitAbilityLevel(u, 'A0C9') 
set r=50+50*level
set f=n*level*5
call UnitDamageTarget( CreateUnit(GetOwningPlayer(u),'n00T',0,0,0), t, r+f, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
endfunction


function Trig_shenshengshenpan_Actions takes nothing returns nothing
local timer tm
local integer i=0
local unit m
local unit t=GetSpellTargetUnit()
local unit u=GetTriggerUnit()
local integer level
local real r
local real f

if IsUnitEnemy(t, GetTriggerPlayer()) == true then
set tm=CreateTimer()
set i=GetHandleId(tm)
set m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash1,i,2,t)
call SaveUnitHandle(udg_Hash1,i,1,u)
call TimerStart(tm,0.02,false,function chestlinkenshenpan)
else
set i=GetConvertedPlayerId(GetOwningPlayer(t))
set level=GetUnitAbilityLevel(u, 'A0C9') 
set r=50+50*level
set f=I2R(udg_KilledTimes[i]*5*level)
call SetUnitState( t, UNIT_STATE_LIFE, GetUnitState(t, UNIT_STATE_LIFE)+r+f )
endif


set tm=null
set m=null
set t=null
set u=null
endfunction

//===========================================================================
function InitTrig_shenshengshenpan takes nothing returns nothing
    set gg_trg_shenshengshenpan = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_shenshengshenpan, Condition( function Trig_shenshengshenpan_Conditions ) )
    call TriggerAddAction( gg_trg_shenshengshenpan, function Trig_shenshengshenpan_Actions )
endfunction
