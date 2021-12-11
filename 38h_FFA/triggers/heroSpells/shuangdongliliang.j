
//===========================================================================
// Trigger: shuangdongliliang
//===========================================================================
function Trig_shuangdongliliang_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08Q' 
endfunction

function Trig_shuangdongliliang_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit t=GetSpellTargetUnit()
local unit m
local integer level=GetUnitAbilityLevel(u,'A08Q')
if IsUnitEnemy(t, GetOwningPlayer(u)) == true then
set m=CreateUnit(GetOwningPlayer(u),'o007',GetUnitX(t),GetUnitY(t),0)
call IssueTargetOrderById( m, 851983, t )
else
set m=CreateUnit(GetOwningPlayer(u),'n001',0,0,0)
call UnitAddAbility(m,'AUfu')
call SetUnitAbilityLevel(m,'AUfu',level)
call IssueTargetOrderById( m, 852225, t )
endif
if level<4 then
call UnitApplyTimedLife( m, 'BTLF', 2.5+level )
else
call UnitApplyTimedLife( m, 'BTLF', 7.5 )
endif
set u=null
set t=null
set m=null
endfunction

//===========================================================================
function InitTrig_shuangdongliliang takes nothing returns nothing
    set gg_trg_shuangdongliliang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_shuangdongliliang, Condition( function Trig_shuangdongliliang_Conditions ) )
    call TriggerAddAction( gg_trg_shuangdongliliang, function Trig_shuangdongliliang_Actions )
endfunction
