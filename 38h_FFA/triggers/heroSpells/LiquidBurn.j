
//===========================================================================
// Trigger: LiquidBurn
//===========================================================================
function Trig_LiquidBurn_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03J' 
endfunction





function LiquidBurnAct takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u
local integer n=LoadInteger(udg_Hash1,i,2)
local unit m

if n>0 then
set u=LoadUnitHandle(udg_Hash1,i,1)
set m=CreateUnit(GetOwningPlayer(u),'n000',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
call IssueImmediateOrderById( m, 852177 )
call SaveInteger(udg_Hash1,i,2,n-1)
call UnitApplyTimedLife( m, 'BTLF', n*0.5 )
else
set u=LoadUnitHandle(udg_Hash1,i,1)
call UnitRemoveAbility(u,'Amgl')
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A03J', true )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'Aliq', false )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
set m=null
endfunction

function Trig_LiquidBurn_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u,'A03J')
local integer i=GetHandleId(tm)

call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'Aliq', true )
call SaveInteger(udg_Hash1,i,2,30)
call SaveUnitHandle(udg_Hash1,i,1,u)
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A03J', false )
call UnitAddAbility(u,'Amgl')
call TimerStart(tm,0.5,true,function LiquidBurnAct)

set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_LiquidBurn takes nothing returns nothing
    set gg_trg_LiquidBurn = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LiquidBurn, Condition( function Trig_LiquidBurn_Conditions ) )
    call TriggerAddAction( gg_trg_LiquidBurn, function Trig_LiquidBurn_Actions )
endfunction
