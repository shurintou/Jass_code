
//===========================================================================
// Trigger: LightningBolt
//===========================================================================
function Trig_LightningBolt_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A050' 
endfunction

function LBCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local unit m

if UnitHasBuffBJ(t,'BUhf') then
set u=LoadUnitHandle(udg_Hash3,i,1)
call UnitApplyTimedLife( CreateUnit(GetOwningPlayer(u),'e001',GetUnitX(t),GetUnitY(t),0), 'BTLF', 5.00 )
set m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(t),GetUnitY(t),0)
call UnitAddAbility(m,'A057')
call UnitAddAbility(m,'AOcl')
call SetUnitAbilityLevel( m, 'AOcl', GetUnitAbilityLevel(u, 'A050') )
call IssueTargetOrderById( m, 852119, t )
call IssueTargetOrderById( m, 852095, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
endif

call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
set m=null
endfunction


function Trig_LightningBolt_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function LBCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_LightningBolt takes nothing returns nothing
    set gg_trg_LightningBolt = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LightningBolt, Condition( function Trig_LightningBolt_Conditions ) )
    call TriggerAddAction( gg_trg_LightningBolt, function Trig_LightningBolt_Actions )
endfunction
