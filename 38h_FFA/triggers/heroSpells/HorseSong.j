
//===========================================================================
// Trigger: HorseSong
//
// call UnitRemoveAbility(u,'BUhf')
//===========================================================================
function Trig_HorseSong_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A02R' 
endfunction

function HCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local unit m
local integer level=0
local unit n
local real x=0
local real y=0
local real dx=0
local real dy=0

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash3,i,1)
set level=GetUnitAbilityLevel(u,'A02R')
set x=GetUnitX(u)
set y=GetUnitY(u)
set dx=GetUnitX(t)
set dy=GetUnitY(t)
set m=CreateUnit(GetOwningPlayer(u),'n001',dx,dy,0)
set n=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\NightElf\\Taunt\\TauntCaster.mdl", x, y) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\NightElf\\Taunt\\TauntCaster.mdl", dx, dy) )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call UnitApplyTimedLife( n, 'BTLF', 5.00 )
call UnitAddAbility(m,'ACt2')
call SetUnitAbilityLevel( m, 'ACt2',level)
call UnitAddAbility(n,'AHtb')
call SetUnitAbilityLevel( n, 'AHtb',level)
call IssueImmediateOrderById( m, 852253 )
call IssueTargetOrderById( n, 852095, t )
else//有林肯
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set t=null
set m=null
set u=null
set tm=null
set n=null
endfunction


function Trig_HorseSong_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function HCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_HorseSong takes nothing returns nothing
    set gg_trg_HorseSong = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HorseSong, Condition( function Trig_HorseSong_Conditions ) )
    call TriggerAddAction( gg_trg_HorseSong, function Trig_HorseSong_Actions )
endfunction
