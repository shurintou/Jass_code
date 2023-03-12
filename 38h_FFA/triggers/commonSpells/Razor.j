
//===========================================================================
// Trigger: Razor
//===========================================================================
function Trig_Razor_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A052' 
endfunction


function RZCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local unit m

if UnitHasBuffBJ(t,'BUhf') then
set u=LoadUnitHandle(udg_Hash3,i,1)
set m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(u),GetUnitY(u),0)
call SetUnitScale( m, 2.5, 2.5, 2.5 )
call UnitAddAbility(m,'Acrs')
call SetUnitAbilityLevel( m, 'Acrs', GetUnitAbilityLevel(u, 'A052') )
call UnitAddAbility(m,'A053')
call SetUnitAbilityLevel( m, 'A053', 1 )
call UnitDamageTarget( CreateUnit(GetOwningPlayer(u),'n00T',0,0,0), t, 80*GetUnitAbilityLevel(u, 'A052'), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call IssueTargetOrderById( m, 852222, t )
call IssueTargetOrderById( m, 852190, t )
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

function Trig_Razor_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function RZCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_Razor takes nothing returns nothing
    set gg_trg_Razor = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Razor, Condition( function Trig_Razor_Conditions ) )
    call TriggerAddAction( gg_trg_Razor, function Trig_Razor_Actions )
endfunction
