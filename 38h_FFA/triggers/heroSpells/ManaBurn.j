
//===========================================================================
// Trigger: ManaBurn
//===========================================================================
function Trig_ManaBurn_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0AN' 
endfunction

function MBNCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local real hr
local integer int
local real rrr

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash3,i,1)
set int=GetHeroInt(t, true)*4
set hr=GetUnitState(t, UNIT_STATE_MANA)
set rrr=hr-int
  if rrr>0 then
  set rrr=int
  else
  set rrr=hr
  endif
//call DestroyLightning( AddLightningEx("MBUR", false, GetUnitX(u), GetUnitY(u), 60, GetUnitX(t), GetUnitY(t), 60) )
call UnitDamageTarget( u, t, rrr, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call SetUnitState( t, UNIT_STATE_MANA, hr-rrr )
call CreateTextTagUnitBJ("-"+I2S(R2I(rrr)), t, 0, 11.00, 82, 82, 255, 0 )
call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
call SetTextTagPermanent( GetLastCreatedTextTag(), false )
call SetTextTagLifespan( GetLastCreatedTextTag(), 5.00 )
call SetTextTagFadepoint( GetLastCreatedTextTag(), 2 )
endif


call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
endfunction




function Trig_ManaBurn_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function MBNCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_ManaBurn takes nothing returns nothing
    set gg_trg_ManaBurn = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ManaBurn, Condition( function Trig_ManaBurn_Conditions ) )
    call TriggerAddAction( gg_trg_ManaBurn, function Trig_ManaBurn_Actions )
endfunction
