
//===========================================================================
// Trigger: learnnature
//===========================================================================
function Trig_learnnature_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A0BC' 
endfunction

function checkifhavetree takes nothing returns nothing
local integer i=GetDestructableTypeId(GetEnumDestructable())
if i == 'LTlt' or i == 'CTtr' then
call SaveInteger(udg_Hash1,GetHandleId(gg_trg_learnnature),2,1)
endif
endfunction


function checktree takes nothing returns nothing
local integer i=GetHandleId(gg_trg_learnnature)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local location l=GetUnitLoc(u)
local integer level
local unit m=LoadUnitHandle(udg_Hash1,i,3)

call SaveInteger(udg_Hash1,i,2,0)
call EnumDestructablesInCircleBJ( 375, l, function checkifhavetree)
if GetUnitState(u, UNIT_STATE_LIFE) > 0 and LoadInteger(udg_Hash1,i,2)==1 then
set level=GetUnitAbilityLevel(u, 'A0BC')
call SetUnitAbilityLevel( u, 'A0BD', 1+level )
call SetUnitAbilityLevel( m, 'A0BE', level )
call IssueTargetOrderById( m, 852101, u )
call SetUnitX(m,GetUnitX(u))
call SetUnitY(m,GetUnitY(u))
call SetUnitPathing( u, false )
else
call SetUnitX(m,-7223)
call SetUnitY(m,4889)
call SetUnitAbilityLevel( u, 'A0BD', 1 )
call UnitRemoveAbility( u, 'B03S' )
    if ciwh(u,'I01D')>=1 then
    else
    call SetUnitPathing( u, true )
    endif
endif

call RemoveLocation(l)
set u=null
set m=null
set l=null
endfunction


function Trig_learnnature_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local integer i=GetHandleId(gg_trg_learnnature)
local unit m=CreateUnit(GetTriggerPlayer(),'n006',0,0,0)

call UnitAddAbility( m, 'A0BE' )
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveInteger(udg_Hash1,i,2,0)
call SaveUnitHandle(udg_Hash1,i,3,m)
call TimerStart(tm,1,true,function checktree)
call DisableTrigger( GetTriggeringTrigger() )

set tm=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_learnnature takes nothing returns nothing
    set gg_trg_learnnature = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_learnnature, Condition( function Trig_learnnature_Conditions ) )
    call TriggerAddAction( gg_trg_learnnature, function Trig_learnnature_Actions )
endfunction
