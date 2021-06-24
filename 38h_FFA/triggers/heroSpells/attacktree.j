
//===========================================================================
// Trigger: attacktree
//===========================================================================
function Trig_attacktree_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) 
endfunction

function Trig_attacktree_Actions takes nothing returns nothing
local unit t
local unit m
local integer i=GetRandomInt(1,100)
if i<18 then
set t=GetEventTargetUnit()
set m=CreateUnit(GetTriggerPlayer(),'n001',GetUnitX(t),GetUnitY(t),0)
call UnitAddAbility(m,'A05V')
call UnitApplyTimedLife( m, 'BTLF', 5 )
call IssueTargetOrderById( m, 852106, t )
endif
set t=null
set m=null
endfunction

//===========================================================================
function InitTrig_attacktree takes nothing returns nothing
    set gg_trg_attacktree = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_attacktree, Condition( function Trig_attacktree_Conditions ) )
    call TriggerAddAction( gg_trg_attacktree, function Trig_attacktree_Actions )
endfunction
