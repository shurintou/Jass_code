
//===========================================================================
// Trigger: qiangxizhichu
//===========================================================================
function Trig_qiangxizhichu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A07C' 
endfunction

function Trig_qiangxizhichu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m=CreateUnit(GetTriggerPlayer(),'n00K',GetSpellTargetX(),GetSpellTargetY(),0)
local integer level=GetUnitAbilityLevel(u, 'A07C')
call SetUnitAbilityLevel( m, 'A07A', level )
call SetUnitAbilityLevel( m, 'A07B', level )
call UnitApplyTimedLife( m, 'BHwe', 15.00 )
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_qiangxizhichu takes nothing returns nothing
    set gg_trg_qiangxizhichu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_qiangxizhichu, Condition( function Trig_qiangxizhichu_Conditions ) )
    call TriggerAddAction( gg_trg_qiangxizhichu, function Trig_qiangxizhichu_Actions )
endfunction
