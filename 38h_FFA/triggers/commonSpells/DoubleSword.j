
//===========================================================================
// Trigger: DoubleSword
//===========================================================================
function Trig_DoubleSword_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A058' 
endfunction

function DSCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local integer level=0
local unit m

if UnitHasBuffBJ(t,'BUhf') then
set u=LoadUnitHandle(udg_Hash3,i,1)
set level=GetUnitAbilityLevel(u,'A058')
call UnitDamageTarget( u, t, 100+(75*level), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call UnitDamageTarget( u, u, 100+(75*level), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
set m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(t),GetUnitY(t),0)
call UnitAddAbility(m,'A057')
call IssueTargetOrderById( m, 852095, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
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


function Trig_DoubleSword_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function DSCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_DoubleSword takes nothing returns nothing
    set gg_trg_DoubleSword = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_DoubleSword, Condition( function Trig_DoubleSword_Conditions ) )
    call TriggerAddAction( gg_trg_DoubleSword, function Trig_DoubleSword_Actions )
endfunction
