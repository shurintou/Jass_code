
//===========================================================================
// Trigger: FireOnUnit
//
// (udg_Hash1,GetHandleId(u),63)小胡子火力聚焦的目标
//===========================================================================
function Trig_FireOnUnit_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03D' 
endfunction


function FOUcheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer m=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,m,2)
local unit u
local integer i=0

if UnitHasBuffBJ(t,'BUhf') then
set u=LoadUnitHandle(udg_Hash3,m,1)
set i=GetUnitAbilityLevel(u,'A03D')
call UnitAddAbility( u, 'A03E' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'AEar', true )
call IssueTargetOrderById( u, 851983, t )
call SaveUnitHandle(udg_Hash1,GetHandleId(u),63,t)
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, m )
call PauseTimer(tm)
call DestroyTimer(tm)

set u=null
set t=null
set tm=null
endfunction


function Trig_FireOnUnit_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function FOUcheckLinkin)

set tm=null
set m=null
set t=null 
endfunction

//===========================================================================
function InitTrig_FireOnUnit takes nothing returns nothing
    set gg_trg_FireOnUnit = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_FireOnUnit, Condition( function Trig_FireOnUnit_Conditions ) )
    call TriggerAddAction( gg_trg_FireOnUnit, function Trig_FireOnUnit_Actions )
endfunction
