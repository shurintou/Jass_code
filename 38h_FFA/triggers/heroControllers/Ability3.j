
//===========================================================================
// Trigger: Ability3
//
// 
// local timer tm=GetExpiredTimer()
// local integer i=GetHandleId(tm)
// local unit u=LoadUnitHandle(udg_Hash1,i,1)
// local integer n=LoadInteger(udg_Hash1,i,2)
//===========================================================================
function Trig_Ability3_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    if  IsUnitType(u, UNIT_TYPE_HERO) == true then
    set u=null
    return true
    else
    set u=null
    call SetPlayerState( GetOwningPlayer(u), PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(GetOwningPlayer(u), PLAYER_STATE_RESOURCE_LUMBER)+1 )
    return false
    endif
    set u=null
endfunction


function addmoneyewai takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash3,GetHandleId(GetExpiredTimer()),1)
local player p=GetOwningPlayer(u)
call SetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)+4*GetUnitAbilityLevel(u, 'A0E4') )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl", u, "origin") )
set u=null
set p=null
endfunction

function ewiashouru takes unit u returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
call SaveUnitHandle(udg_Hash3,i,1,u)
call TimerStart(tm,10,true,function addmoneyewai)
set tm=null
endfunction

function Trig_Ability3_Actions takes nothing returns nothing
local unit u=udg_PlayerLockToHero[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))]
local integer i=GetItemTypeId(GetSoldItem())
local player p=GetOwningPlayer(u)
local integer n=GetConvertedPlayerId(p)
local integer m=0
local integer e

set udg_lsmb=MultiboardGetItem(udg_BlackBoard,n,11)
call MultiboardSetItemStyle( udg_lsmb, false, true )
if LoadInteger(udg_Hash3,n,3)!=723 then
  if LoadInteger(udg_Hash2,971,158)==3 and CheckAlleyPlayerAbility(p,3,i)==38 then//1是主技能，2是副技能，3是被动技能
  call DisplayTextToPlayer( p, 0, 0, "|cffff0303此技能已有己方英雄使用,请学习其他技能|r")
  call SetPlayerState( p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)+1 )
  set u=null
  set p=null
  return
  endif
  call SaveInteger(udg_Hash2,n,74,i)//72主技能，73副技能，74被动技能
  
  if i=='I01T' then//不可侵犯
  call UnitAddAbility( u, 'A04E' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMagicImmunity.blp" )
  
  call UnitMakeAbilityPermanent( u, true, 'A04E' )
  set udg_Ability3[n]='A04E'
  else
  if i=='I02G' then//海妖外壳
  call UnitAddAbility( u, 'Assk' )
  call seashiledact(u)
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNNagaArmorUp3.blp" )
  call UnitMakeAbilityPermanent( u, true, 'Assk' )
  set udg_Ability3[n]='Assk'
  else
  if i=='I02H' then//不洁之力
  
call UnitAddAbility( u, 'AUau' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\PassiveButtons\\PASBTNUnholyAura.blp" )
  call UnitMakeAbilityPermanent( u, true, 'AUau' )
  set udg_Ability3[n]='AUau'
  else
  if i=='I02I' then//神行太保
  call UnitAddAbility( u, 'AOr2' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNEtherealFormOn.blp" )
  call TriggerRegisterUnitEvent( gg_trg_HolyMove, u, EVENT_UNIT_TARGET_IN_RANGE )
  call UnitMakeAbilityPermanent( u, true, 'AOr2' )
  set udg_Ability3[n]='AOr2'
  else
  if i=='I02J' then//反击
  call UnitAddAbility( u, 'AEah' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNThorns.blp" )
  call UnitMakeAbilityPermanent( u, true, 'AEah' )
  set udg_Ability3[n]='AEah'
  else
  if i=='I02M' then//退化光环
  call UnitAddAbility( u, 'A05A' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSpiritLink.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A05A' )
  set udg_Ability3[n]='A05A'
  else
  if i=='I02N' then//余震
  call UnitAddAbility( u, 'A05B' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSmash.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A05B' )
  set udg_Ability3[n]='A05B'
  else
  if i=='I02O' then//并列
  call UnitAddAbility( u, 'A05E' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMassTeleport.blp" )
  call TriggerRegisterUnitEvent( gg_trg_BingLie, u, EVENT_UNIT_TARGET_IN_RANGE )
  call UnitMakeAbilityPermanent( u, true, 'A05E' )
  set udg_Ability3[n]='A05E'
  else
  if i=='I02P' then//法术护盾
  call UnitAddAbility( u, 'A0E4' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMGExchange.blp" )
  call ewiashouru(u)
  call UnitMakeAbilityPermanent( u, true, 'A0E4' )
  set udg_Ability3[n]='A0E4'
  else
  if i=='I02Q' then//醉拳
  set e=GetHandleId(u)
  call UnitAddAbility( u, 'Acdb' )
  call DrinkBoxingAct(u)
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDrunkenDodge.blp" )
  call UnitMakeAbilityPermanent( u, true, 'Acdb' )
  call SetUnitVertexColor( u, LoadInteger(udg_Hash2,e,10002), LoadInteger(udg_Hash2,e,10003), LoadInteger(udg_Hash2,e,10004),178)
  set udg_Ability3[n]='Acdb'
  else
  if i=='I02R' then//魔王降临
  call UnitAddAbility( u, 'A05F' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNRegenerationAura.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A05F' )
  set udg_Ability3[n]='A05F'
  else
  endif
  endif
  endif
  endif
  endif
  endif
  endif
  endif
  endif
  endif
  endif
call SaveInteger(udg_Hash3,n,3,723)
call DisplayTextToPlayer( p, 0, 0, "已成功学习|cff1ce6b9"+GetAbilityName(udg_Ability3[n])+"|r" )
else
  set m=GetUnitAbilityLevel(u, udg_Ability3[n]) 
  if m!= 4 then
  call SetUnitAbilityLevel( u, udg_Ability3[n], m+1 )
  call DisplayTextToPlayer( p, 0, 0, "已成功升级|cff1ce6b9"+GetAbilityName(udg_Ability3[n])+"|r" )
  else
  call DisplayTextToPlayer( p, 0, 0,"|cff20c000您的技能已升到顶级|r")
  call SetPlayerState( p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)+1 )
  endif
endif

call MultiboardReleaseItem(udg_lsmb)

set p=null
set u=null
endfunction

//===========================================================================
function InitTrig_Ability3 takes nothing returns nothing
    set gg_trg_Ability3 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Ability3, gg_unit_nmr3_0090, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_Ability3, Condition( function Trig_Ability3_Conditions ) )
    call TriggerAddAction( gg_trg_Ability3, function Trig_Ability3_Actions )
endfunction
