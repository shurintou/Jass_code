
//===========================================================================
// Trigger: FrozenFeng
//===========================================================================
function Trig_FrozenFeng_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A05R' 
endfunction

function FFCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local unit m
local integer level=0


if UnitHasBuffBJ(t,'BUhf') then
set u=LoadUnitHandle(udg_Hash3,i,1)
set level=GetUnitAbilityLevel(u,'A05R')
set m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(t),GetUnitY(t),0)
call UnitAddAbility( m, 'A05Y' )
call SetUnitAbilityLevel( m, 'A05Y', level )
call UnitAddAbility( m, 'A05X' )
call SetUnitAbilityLevel( m, 'A05X', level )
call UnitApplyTimedLife( m, 'BTLF', 7.00 )
call IssueTargetOrderById( m, 852106, t )
call IssueTargetOrderById( m, 852662, t )
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


function Trig_FrozenFeng_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function FFCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_FrozenFeng takes nothing returns nothing
    set gg_trg_FrozenFeng = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_FrozenFeng, Condition( function Trig_FrozenFeng_Conditions ) )
    call TriggerAddAction( gg_trg_FrozenFeng, function Trig_FrozenFeng_Actions )
endfunction
