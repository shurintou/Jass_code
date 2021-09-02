
//===========================================================================
// Trigger: qianglijianyu
//
// 风行技能存储于此触发
//===========================================================================
function Trig_qianglijianyu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0C1' 
endfunction

function Trig_qianglijianyu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=GetHandleId(gg_trg_zhunbeiqiangli)
local real x=LoadReal(udg_Hash1,i,3)
local real y=LoadReal(udg_Hash1,i,4)
local unit t=CreateUnit(GetTriggerPlayer(),'n006',x,y,0)
local unit m=CreateUnit(GetTriggerPlayer(),'e001',GetUnitX(u),GetUnitY(u),0)
call UnitAddAbility( m, 'A0C0' )
if udg_WeatherN==3 then
call SetUnitAbilityLevel(m, 'A0C0', 3+GetUnitAbilityLevel(u, 'A0C1') )
else
call SetUnitAbilityLevel(m, 'A0C0', GetUnitAbilityLevel(u, 'A0C1') )
endif
call UnitApplyTimedLife( m, 'BTLF', 10 )
call IssuePointOrderById( m, 852664, x, y )
call UnitAddAbility( t, 'A0C2' )
call UnitApplyTimedLife( t, 'BTLF', 10 )
call UnitAddAbility( m, 'Amrf' )
call UnitRemoveAbility( m, 'Amrf' )
call SetUnitFlyHeight(  m, 2000, 500.00 )
call SetUnitTimeScale( u, 1.00 )
set u=null
set t=null
set m=null
endfunction

//===========================================================================
function InitTrig_qianglijianyu takes nothing returns nothing
    set gg_trg_qianglijianyu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_qianglijianyu, Condition( function Trig_qianglijianyu_Conditions ) )
    call TriggerAddAction( gg_trg_qianglijianyu, function Trig_qianglijianyu_Actions )
endfunction
