
//===========================================================================
// Trigger: stunbyshixiang
//===========================================================================
function Trig_stunbyshixiang_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'Astn' and GetUnitAbilityLevel(GetTriggerUnit(),'ACmi')==0
endfunction

function stunrrrrr takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local real x=LoadReal(udg_Hash1,i,1)
local real y=LoadReal(udg_Hash1,i,2)
local unit u=CreateUnit(GetOwningPlayer(LoadUnitHandle(udg_Hash1,i,3)),'n001',x,y,0)


call UnitAddAbility(u,'A088')
call IssueImmediateOrderById( u, 852127 )
call FlushChildHashtable( udg_Hash1, i )
call UnitApplyTimedLife( u, 'BTLF', 2)
call PauseTimer(tm)
call DestroyTimer(tm)


set tm=null
set u=null
endfunction


function Trig_stunbyshixiang_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local integer i=GetHandleId(tm)


call TimerStart(tm,1.3,false,function stunrrrrr)
call SaveReal(udg_Hash1,i,1,GetUnitX(u))
call SaveReal(udg_Hash1,i,2,GetUnitY(u))
call SaveUnitHandle(udg_Hash1,i,3,u)
set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_stunbyshixiang takes nothing returns nothing
    set gg_trg_stunbyshixiang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_stunbyshixiang, Condition( function Trig_stunbyshixiang_Conditions ) )
    call TriggerAddAction( gg_trg_stunbyshixiang, function Trig_stunbyshixiang_Actions )
endfunction
