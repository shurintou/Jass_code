
//===========================================================================
// Trigger: zhandouhoujiao
//===========================================================================
function Trig_zhandouhoujiao_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0BS' 
endfunction

function Trig_zhandouhoujiao_Actions takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),1)
local unit m=CreateUnit(GetOwningPlayer(u),'n001',0,0,0)
call UnitAddAbility( m, 'Ablo' )
call SetUnitAbilityLevel( m, 'Ablo', GetUnitAbilityLevel(u, 'A0BS') )
call UnitApplyTimedLife( m, 'BTLF', 6 )
call IssueTargetOrderById( m, 852101, LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),2) )
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_zhandouhoujiao takes nothing returns nothing
    set gg_trg_zhandouhoujiao = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zhandouhoujiao, Condition( function Trig_zhandouhoujiao_Conditions ) )
    call TriggerAddAction( gg_trg_zhandouhoujiao, function Trig_zhandouhoujiao_Actions )
endfunction
