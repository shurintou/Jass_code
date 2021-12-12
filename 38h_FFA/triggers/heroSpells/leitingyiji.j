
//===========================================================================
// Trigger: leitingyiji
//===========================================================================
function Trig_leitingyiji_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'AHtc' 
endfunction

function Trig_leitingyiji_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
call UnitAddAbility( m, 'A08W' )
call IssuePointOrderById( m, 852592, GetUnitX(u), GetUnitY(u) )
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_leitingyiji takes nothing returns nothing
    set gg_trg_leitingyiji = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_leitingyiji, Condition( function Trig_leitingyiji_Conditions ) )
    call TriggerAddAction( gg_trg_leitingyiji, function Trig_leitingyiji_Actions )
endfunction
