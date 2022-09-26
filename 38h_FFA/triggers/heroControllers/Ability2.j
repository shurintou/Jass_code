
//===========================================================================
// Trigger: Ability2
//===========================================================================
function Trig_Ability2_Conditions takes nothing returns boolean
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



function Trig_Ability2_Actions takes nothing returns nothing
local unit u=udg_PlayerLockToHero[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))]
local integer i=GetItemTypeId(GetSoldItem())
local player p=GetOwningPlayer(u)
local integer n=GetConvertedPlayerId(p)
local integer m=0

set udg_lsmb=MultiboardGetItem(udg_BlackBoard,n,10)
call MultiboardSetItemStyle( udg_lsmb, false, true )

if LoadInteger(udg_Hash3,n,2)!=723 then
  if LoadInteger(udg_Hash2,971,158)==3 and CheckAlleyPlayerAbility(p,2,i)==38 then//1是主技能，2是副技能，3是被动技能
  call DisplayTextToPlayer( p, 0, 0, "|cffff0303此技能已有己方英雄使用,请学习其他技能|r")
  call SetPlayerState( p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)+1 )
  set u=null
  set p=null
  return
  endif
  call SaveInteger(udg_Hash2,n,73,i)//72主技能，73副技能，74被动技能
 
  if i=='I01S' then//离子外壳
  call UnitAddAbility( u, 'A0A9' )
  call TriggerRegisterUnitEvent( gg_trg_LiZiWaiKe, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFireBolt.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A0A9' )
  set udg_Ability2[n]='A0A9'
  else
  if i=='I01W' then//X标记
  call UnitAddAbility( u, 'A04J' )
  call TriggerRegisterUnitEvent( gg_trg_ReturntoX, u, EVENT_UNIT_SPELL_EFFECT )
  call TriggerRegisterUnitEvent( gg_trg_Xbiaoji, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSpy.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A04J' )
  set udg_Ability2[n]='A04J'
  else
  if i=='I025' then//幻象
  call UnitAddAbility( u, 'A04U' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMirrorImage.blp" )
  call TriggerRegisterUnitEvent( gg_trg_Shadow, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A04U' )
  set udg_Ability2[n]='A04U'
  else
  if i=='I026' then//闪烁突袭
  call UnitAddAbility( u, 'A04W' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNBearBlink.blp" )
  call TriggerRegisterUnitEvent( gg_trg_BlinkAttack, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A04W' )
  set udg_Ability2[n]='A04W'
  else
  if i=='I027' then//奔腾
  call UnitAddAbility( u, 'A04Y' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSirenMaster.blp" )
  call TriggerRegisterUnitEvent( gg_trg_FastRun, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A04Y' )
  set udg_Ability2[n]='A04Y'
  else
  if i=='I028' then//雷击
  call UnitAddAbility( u, 'A050' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMonsoon.blp" )
  call TriggerRegisterUnitEvent( gg_trg_LightningBolt, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A050' )
  set udg_Ability2[n]='A050'
  else
  if i=='I029' then//冰封禁制
  call UnitAddAbility( u, 'A05R' )
  call TriggerRegisterUnitEvent( gg_trg_FrozenFeng, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFreezingBreath.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A05R' )
  set udg_Ability2[n]='A05R'
  else
  if i=='I02A' then//激光
  call UnitAddAbility( u, 'A052' )
  call TriggerRegisterUnitEvent( gg_trg_Razor, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNManaFlareOff.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A052' )
  set udg_Ability2[n]='A052'
  else
  if i=='I02B' then//活体护甲
  call UnitAddAbility( u, 'Ainf' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNNaturesBlessing.blp" )
  call UnitMakeAbilityPermanent( u, true, 'Ainf' )
  set udg_Ability2[n]='Ainf'
  else
  if i=='I02C' then//噩梦
  call UnitAddAbility( u, 'AUsl' )
  call TriggerRegisterUnitEvent( gg_trg_BadSleep, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNWandOfShadowSight.blp" )
  call UnitMakeAbilityPermanent( u, true, 'AUsl' )
  set udg_Ability2[n]='AUsl'
  else
  if i=='I02D' then//忠诚考验
  call UnitAddAbility( u, 'A054' )
  call TriggerRegisterUnitEvent( gg_trg_HonestChect, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNStaffOfPreservation.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A054' )
  set udg_Ability2[n]='A054'
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
call SaveInteger(udg_Hash3,n,2,723)
call DisplayTextToPlayer( p, 0, 0, "已成功学习|cff1ce6b9"+GetAbilityName(udg_Ability2[n])+"|r" )
else
  set m=GetUnitAbilityLevel(u, udg_Ability2[n]) 
  if m!= 4 then
  call SetUnitAbilityLevel( u, udg_Ability2[n], m+1 )
  call DisplayTextToPlayer( p, 0, 0, "已成功升级|cff1ce6b9"+GetAbilityName(udg_Ability2[n])+"|r" )
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
function InitTrig_Ability2 takes nothing returns nothing
    set gg_trg_Ability2 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Ability2, gg_unit_nmr2_0021, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_Ability2, Condition( function Trig_Ability2_Conditions ) )
    call TriggerAddAction( gg_trg_Ability2, function Trig_Ability2_Actions )
endfunction
