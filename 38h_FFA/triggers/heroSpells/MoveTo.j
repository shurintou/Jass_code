
//===========================================================================
// Trigger: MoveTo
//===========================================================================
function Trig_MoveTo_Conditions takes nothing returns boolean
    return IsUnitIllusion(GetSpellTargetUnit()) == true  and GetSpellAbilityId() == 'A047' 
endfunction

function Trig_MoveTo_Actions takes nothing returns nothing
local unit m=GetSpellTargetUnit()
local unit u=GetTriggerUnit()
call SetUnitX(u,GetUnitX(m))
call SetUnitY(u,GetUnitY(m))
call IssueImmediateOrderById( u, 851972 )
call KillUnit(m)
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_MoveTo takes nothing returns nothing
    set gg_trg_MoveTo = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_MoveTo, Condition( function Trig_MoveTo_Conditions ) )
    call TriggerAddAction( gg_trg_MoveTo, function Trig_MoveTo_Actions )
endfunction
