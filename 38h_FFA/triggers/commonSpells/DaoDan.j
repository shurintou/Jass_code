
//===========================================================================
// Trigger: DaoDan
//===========================================================================
function Trig_DaoDan_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0AQ' 
endfunction


function daodanact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash2,i,1)
local unit m
local integer n=LoadInteger(udg_Hash2,i,3)
local real x
local real y

if n>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
set x=GetUnitX(u)
set y=GetUnitY(u)
set m=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)
call UnitAddAbility(m,'ANc2')
call SetUnitAbilityLevel(m,'ANc2',GetUnitAbilityLevel(u,'A0AQ'))
call IssuePointOrderById( m, 852652,x ,y  )
call UnitApplyTimedLife( m, 'BTLF', 2.00 )
call SaveInteger(udg_Hash2,i,3,n-1)
else
call FlushChildHashtable( udg_Hash2, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif



set tm=null
set u=null
set m=null
endfunction

function Trig_DaoDan_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n005',x,y,0)

call UnitAddAbility(m,'ANc2')
call SetUnitAbilityLevel(m,'ANc2',GetUnitAbilityLevel(u,'A0AQ'))
call IssuePointOrderById( m, 852652,x ,y  )
call UnitApplyTimedLife( m, 'BTLF', 2.00 )

call SaveUnitHandle(udg_Hash2,i,1,u)
call SaveInteger(udg_Hash2,i,3,30)
call TimerStart(tm,0.1,true,function daodanact)

set u=null
set tm=null
set m=null
endfunction

//===========================================================================
function InitTrig_DaoDan takes nothing returns nothing
    set gg_trg_DaoDan = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_DaoDan, Condition( function Trig_DaoDan_Conditions ) )
    call TriggerAddAction( gg_trg_DaoDan, function Trig_DaoDan_Actions )
endfunction
