
//===========================================================================
// Trigger: hunluanC
//===========================================================================
function Trig_hunluanC_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0BW' 
endfunction

function HLZJCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash1,i,2)
local unit u
local unit m
local real hr
local integer level
local integer n=0

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash1,i,1)
set level=GetUnitAbilityLevel(u,'A0BW')
set m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
  if GetUnitAbilityLevel(u,'B03W')>0 then
  set n=1+level
    if n>4 then
    set n=4 
    endif
  set hr=175+25*level
  else
  set n=1+level
    if n>4 then
    set n=GetRandomInt(2,4)
    else
    set n=GetRandomInt(1,n)
    endif
  set hr=GetRandomReal(-49+50*level,175+25*level)
  endif
 
call UnitAddAbility(m,'A0BX')
call SetUnitAbilityLevel( m, 'A0BX', n)
call IssueTargetOrderById( m, 852095, t )
call UnitDamageTarget( u, t, hr, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call CreateTextTagUnitBJ( I2S(n), t, 0, 14.00, 50, 255, 50, 0 )
call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
call SetTextTagPermanent( GetLastCreatedTextTag(), false )
call SetTextTagLifespan( GetLastCreatedTextTag(), 3.00 )
call SetTextTagFadepoint( GetLastCreatedTextTag(), 2.60 )
else
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
set m=null
endfunction

function Trig_hunluanC_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()
local unit u=GetTriggerUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash1,i,2,t)
call SaveUnitHandle(udg_Hash1,i,1,u)
call TimerStart(tm,0.01,false,function HLZJCheckLinkin)

set tm=null
set u=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_hunluanC takes nothing returns nothing
    set gg_trg_hunluanC = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_hunluanC, Condition( function Trig_hunluanC_Conditions ) )
    call TriggerAddAction( gg_trg_hunluanC, function Trig_hunluanC_Actions )
endfunction
