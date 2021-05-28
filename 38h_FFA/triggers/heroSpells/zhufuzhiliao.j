
//===========================================================================
// Trigger: zhufuzhiliao
//===========================================================================
function Trig_zhufuzhiliao_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0C8' 
endfunction

function Trig_zhufuzhiliao_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local unit m=CreateUnit(GetTriggerPlayer(),'n001',x,y,0)

call UnitAddAbility( m, 'A0CA' )
call SetUnitAbilityLevel( m, 'A0CA', GetUnitAbilityLevel(u, 'A0C8') )
call UnitApplyTimedLife( m, 'BTLF', 10 )
call IssuePointOrderById( m, 852664, x, y )

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_zhufuzhiliao takes nothing returns nothing
    set gg_trg_zhufuzhiliao = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zhufuzhiliao, Condition( function Trig_zhufuzhiliao_Conditions ) )
    call TriggerAddAction( gg_trg_zhufuzhiliao, function Trig_zhufuzhiliao_Actions )
endfunction
