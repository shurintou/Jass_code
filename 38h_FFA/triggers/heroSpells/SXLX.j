
//===========================================================================
// Trigger: SXLX
//===========================================================================
function Trig_SXLX_Conditions takes nothing returns boolean
    call SetUnitAnimation( GetTriggerUnit(), "attack" )
    return GetSpellAbilityId() == 'A05U' 
endfunction


function SXLXCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit m
local unit u
local real r=0
local real x=0
local real y=0
local real dx=0
local real dy=0
local real ex=0
local real ey=0


if UnitHasBuffBJ(t,'BUhf') then
set u=LoadUnitHandle(udg_Hash3,i,1)
set x=GetUnitX(u)
set y=GetUnitY(u)
set dx=GetUnitX(t)
set dy=GetUnitY(t)
set ex=(x+dx)/2
set ey=(y+dy)/2
call UnitDamageTarget( u, t, 50*GetUnitAbilityLevel(u, 'A05U'), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS )
call SetUnitX(u,ex)
call SetUnitY(u,ey)
call SetUnitX(t,ex)
call SetUnitY(t,ey)
set m=CreateUnit(GetOwningPlayer(u),'n001',0,0,0)
call UnitAddAbility(m,'A078')
call UnitApplyTimedLife( m, 'BHwe', 6 )
call IssueTargetOrderById( m, 852101, u )
call IssueTargetOrderById( u, 851983, t )
endif

call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
endfunction

function Trig_SXLX_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function SXLXCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_SXLX takes nothing returns nothing
    set gg_trg_SXLX = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_SXLX, Condition( function Trig_SXLX_Conditions ) )
    call TriggerAddAction( gg_trg_SXLX, function Trig_SXLX_Actions )
endfunction
