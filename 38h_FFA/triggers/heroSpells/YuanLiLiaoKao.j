
//===========================================================================
// Trigger: YuanLiLiaoKao
//
// call UnitRemoveAbility( u, 'Amgr' )
// call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A08Z', true )
// 看一下死了以后复活会不会恢复技能
// gg_trg_StopLiaoKao
// gg_trg_YuanLiLiaoKao
//===========================================================================
function Trig_YuanLiLiaoKao_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0AD' 
endfunction


function kaishihaomo takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
//local unit t=LoadUnitHandle(udg_Hash1,i,2)
local integer r=LoadInteger(udg_Hash1,i,3)
local integer n
local real a

if r>0 then
call SaveInteger(udg_Hash1,i,3,r-1)
else
  if GetUnitAbilityLevel(LoadUnitHandle(udg_Hash1,i,5), 'B03G')>0 and GetUnitState(u, UNIT_STATE_LIFE)>0  then
  call UnitAddAbility( u, 'A0AE' )
  call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\ReplenishMana\\ReplenishManaCaster.mdl", u, "origin") )
  set a=GetUnitState(u, UNIT_STATE_MANA)-0.15*GetUnitState(u, UNIT_STATE_MAX_MANA)*0.1-5
     if a<=10 then
     call SetUnitState( u, UNIT_STATE_MANA, 10  )
     call RemoveUnit(LoadUnitHandle(udg_Hash1,i,2))
     call UnitRemoveAbility( u, 'A0AE' )
     call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A0AD', true )
     call FlushChildHashtable( udg_Hash1, i )
     call PauseTimer(tm)
     call DestroyTimer(tm)
     else
     call SetUnitState( u, UNIT_STATE_MANA, a  )
     endif
  else
  call RemoveUnit(LoadUnitHandle(udg_Hash1,i,2))
  call UnitRemoveAbility( u, 'A0AE' )
  call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A0AD', true )
  call FlushChildHashtable( udg_Hash1, i )
  call PauseTimer(tm)
  call DestroyTimer(tm)
  endif
endif


set tm=null
set u=null
endfunction



function Trig_YuanLiLiaoKao_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local integer r=10+3*GetUnitAbilityLevel(u, 'A0AD')
local unit m=CreateUnit(GetTriggerPlayer(),'n001',GetUnitX(u),GetUnitY(u),0)
local unit t=GetSpellTargetUnit()

call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A0AD', false )
call UnitAddAbility( m, 'A0AC' )
//call IssueTargetOrderById( m, 852483, t )
call IssueTargetOrder( m, "magicleash", t )
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveUnitHandle(udg_Hash1,i,2,m)
call SaveInteger(udg_Hash1,i,3,r)
call SaveInteger(udg_Hash1,i,4,0)
call SaveUnitHandle(udg_Hash1,i,5,t)
call SaveTimerHandle(udg_Hash1,GetHandleId(u),5675,tm)
call TimerStart(tm,0.1,true,function kaishihaomo)

set m=null
set u=null
set t=null
set tm=null
endfunction

//===========================================================================
function InitTrig_YuanLiLiaoKao takes nothing returns nothing
    set gg_trg_YuanLiLiaoKao = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_YuanLiLiaoKao, Condition( function Trig_YuanLiLiaoKao_Conditions ) )
    call TriggerAddAction( gg_trg_YuanLiLiaoKao, function Trig_YuanLiLiaoKao_Actions )
endfunction
