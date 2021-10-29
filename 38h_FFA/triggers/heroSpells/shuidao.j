
//===========================================================================
// Trigger: shuidao
//
// ANca,A0AF
//===========================================================================
function Trig_shuidao_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A0AH' 
endfunction


function shuidao takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local integer n=LoadInteger(udg_Hash1,i,2)
local integer level=GetUnitAbilityLevel(u, 'A0AH') 

if n==0 then
call UnitAddAbility( u, 'A009' )
call UnitAddAbility( u, 'A0AF' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A009', false )
call SetUnitAbilityLevel( u, 'ANca',level)
call SetUnitAbilityLevel( u, 'A0AF',level)
//call SaveInteger(udg_Hash1,i,2,11-2*level)
call EnableTrigger(gg_trg_PanDuanShuiDao)
endif
call SaveInteger(udg_Hash1,i,2,n-1)
set tm=null
set u=null
endfunction


function Trig_shuidao_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local integer i=GetHandleId(tm)
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveInteger(udg_Hash1,i,2,1)
call SaveTimerHandle(udg_Hash1,GetHandleId(u),8304,tm)
call TimerStart(tm,1,true,function shuidao)
call DisableTrigger( GetTriggeringTrigger() )
set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_shuidao takes nothing returns nothing
    set gg_trg_shuidao = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_shuidao, Condition( function Trig_shuidao_Conditions ) )
    call TriggerAddAction( gg_trg_shuidao, function Trig_shuidao_Actions )
endfunction
