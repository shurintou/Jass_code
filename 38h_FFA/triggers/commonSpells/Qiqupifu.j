
//===========================================================================
// Trigger: Qiqupifu
//
// hash2 3793：崎岖皮肤单位
//===========================================================================
function Trig_Qiqupifu_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetAttacker(), GetTriggerPlayer()) == true 
endfunction

function Trig_Qiqupifu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m
local integer i=GetRandomInt(1,100)
local integer level=GetUnitAbilityLevel(u, 'A0A5')

if i<6*level then
set m=LoadUnitHandle(udg_Hash2,GetHandleId(u),3793)
call SetUnitX(m,GetUnitX(u))
call SetUnitY(m,GetUnitY(u))
call SetUnitAbilityLevel( m, 'A0A6', level )
call IssueTargetOrderById( m, 852095, GetAttacker() )
endif

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_Qiqupifu takes nothing returns nothing
    set gg_trg_Qiqupifu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Qiqupifu, Condition( function Trig_Qiqupifu_Conditions ) )
    call TriggerAddAction( gg_trg_Qiqupifu, function Trig_Qiqupifu_Actions )
endfunction
