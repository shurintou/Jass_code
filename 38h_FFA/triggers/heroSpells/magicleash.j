
//===========================================================================
// Trigger: magicleash
//
// udg_Hash1,GetHandleId(u),1342
//===========================================================================
function Trig_magicleash_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A067' 
endfunction

function mlact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
call UnitRemoveAbility(u,'A068')
call UnitRemoveAbility(u,'B00W')
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
set tm=null
set u=null
endfunction

function MLCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local integer level=0
local unit u
local unit m
local timer tt
if UnitHasBuffBJ(t,'BUhf') then
set tt=CreateTimer()
set u=LoadUnitHandle(udg_Hash3,i,1)
set level=GetUnitAbilityLevel(u,'A067')
set m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(u),GetUnitY(u),0)
call UnitAddAbility( m, 'A00J' )
call SetUnitAbilityLevel( m, 'A00J', level )
call UnitApplyTimedLife( m, 'BTLF', 5 )
call IssueTargetOrder( m, "magicleash", t )
call SaveUnitHandle(udg_Hash1,GetHandleId(tt),1,u)
call TimerStart(tt,1+0.5*level,false,function mlact)
call UnitAddAbility(u,'A068')
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)
set tm=null
set t=null
set m=null
set tt=null
set u=null
endfunction


function Trig_magicleash_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()
call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function MLCheckLinkin)
set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_magicleash takes nothing returns nothing
    set gg_trg_magicleash = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_magicleash, Condition( function Trig_magicleash_Conditions ) )
    call TriggerAddAction( gg_trg_magicleash, function Trig_magicleash_Actions )
endfunction
