
//===========================================================================
// Trigger: xuetongmo
//
// 这个触发绑定计时器数据
//===========================================================================
function Trig_xuetongmo_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A0CI' 
endfunction


function huihutongmo takes nothing returns nothing
local integer n=GetHandleId(gg_trg_xuetongmo)
local integer i=LoadInteger(udg_Hash1,n,1)
local unit u
local integer level=0

if i>0 then
call SaveInteger(udg_Hash1,n,1,i-1)
else
call SaveInteger(udg_Hash1,n,1,30)
set u=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_CCCkaominjie),1)
set level=GetUnitAbilityLevel(u,'A0CI' )
    if GetUnitAbilityLevel(u, 'A0CJ')>0 then//3
    call SetUnitAbilityLevel( u, 'A0CJ', level )
    else
    if GetUnitAbilityLevel(u, 'A0CK')>0 then//2
    call UnitRemoveAbility( u, 'A0CK' )
    call UnitAddAbility( u, 'A0CJ' )
    call SetUnitAbilityLevel( u, 'A0CJ', level )
    else
    if GetUnitAbilityLevel(u, 'A0CL')>0 then//1
    call UnitRemoveAbility( u, 'A0CL' )
    call UnitAddAbility( u, 'A0CK' )
    call SetUnitAbilityLevel( u, 'A0CK', level )
    else
    call UnitAddAbility( u, 'A0CL' )
    call SetUnitAbilityLevel( u, 'A0CL', level )
    endif
    endif
    endif
endif

set u=null
endfunction

function Trig_xuetongmo_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
call UnitAddAbility( u, 'A0CJ' )
call TimerStart(CreateTimer(),1,true,function huihutongmo)
call SaveInteger(udg_Hash1,GetHandleId(gg_trg_xuetongmo),1,30)
call DisableTrigger( GetTriggeringTrigger() )
set u=null
endfunction

//===========================================================================
function InitTrig_xuetongmo takes nothing returns nothing
    set gg_trg_xuetongmo = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_xuetongmo, Condition( function Trig_xuetongmo_Conditions ) )
    call TriggerAddAction( gg_trg_xuetongmo, function Trig_xuetongmo_Actions )
endfunction
