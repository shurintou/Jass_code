//===========================================================================
// Trigger: Ability4
//===========================================================================
function Trig_Ability4_Conditions takes nothing returns boolean
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

function Trig_Ability4_Actions takes nothing returns nothing
local unit u=udg_PlayerLockToHero[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))]
local integer i=GetItemTypeId(GetSoldItem())
local player p=GetOwningPlayer(u)
local integer n=GetConvertedPlayerId(p)
local integer m=0


if LoadInteger(udg_Hash3,n,1)!=723 then
  if LoadInteger(udg_Hash2,971,158)==3 and CheckAlleyPlayerAbility(p,1,i)==38 then//1是主技能，2是副技能，3是被动技能
  call DisplayTextToPlayer( p, 0, 0, "|cffff0303此技能已有己方英雄使用,请学习其他技能|r")
  call SetPlayerState( p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)+1 )
  set u=null
  set p=null
  return
  endif
  call SaveInteger(udg_Hash2,n,72,i)//72主技能，73副技能，74被动技能


  set udg_lsmb=MultiboardGetItem(udg_BlackBoard,n,9)
  call MultiboardSetItemStyle( udg_lsmb, false, true )
  if i=='I02F' then//冲击波
  call UnitAddAbility( u, 'A055' )
  call TriggerRegisterUnitEvent( gg_trg_RushWave, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNCorrosiveBreath.blp" )  
  call UnitMakeAbilityPermanent( u, true, 'A055' )
  set udg_Ability1[n]='A055'
  else
  if i=='I02L' then//守护天使
  call UnitAddAbility( u, 'A059' )
  call TriggerRegisterUnitEvent( gg_trg_ProtectAngel, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDivineIntervention.blp" ) 
  call UnitMakeAbilityPermanent( u, true, 'A059' )
  set udg_Ability1[n]='A059'
  else
  if i=='I02W' then//幽冥守卫
  call UnitAddAbility( u, 'A05S' )
  call TriggerRegisterUnitEvent( gg_trg_GhostWard, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNEntrapmentWard.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A05S' )
  set udg_Ability1[n]='A05S'
  else
  if i=='I030' then//照明火箭
  call UnitAddAbility( u, 'A06B' )
  call TriggerRegisterUnitEvent( gg_trg_Flare, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFlare.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A06B' )
  set udg_Ability1[n]='A06B'
  else
  if i=='I032' then//酸性喷雾
  call UnitAddAbility( u, 'A073' )
  call TriggerRegisterUnitEvent( gg_trg_AcidCloud, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHealingSpray.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A073' )
  set udg_Ability1[n]='A073'
  else
  if i=='I036' then//剧变
  call UnitAddAbility( u, 'AOeq' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNUnsummonBuilding.blp" )
  call UnitMakeAbilityPermanent( u, true, 'AOeq' )
  set udg_Ability1[n]='AOeq'
  else
  if i=='I037' then//强袭之触
  call UnitAddAbility( u, 'A07C' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNControlMagic.blp" )
  call TriggerRegisterUnitEvent( gg_trg_qiangxizhichu, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A07C' )
  set udg_Ability1[n]='A07C'
  else
  if i=='I039' then//磁暴冲击
  call UnitAddAbility( u, 'A09J' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNOrbOfLightning.blp" )
  call TriggerRegisterUnitEvent( gg_trg_CiBao, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A09J' )
  set udg_Ability1[n]='A09J'
  else
  if i=='I03L' then//火箭弹幕
  call UnitAddAbility( u, 'A0AQ' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNClusterRockets.blp" )
  call TriggerRegisterUnitEvent( gg_trg_DaoDan, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A0AQ' )
  set udg_Ability1[n]='A0AQ'
  else
  if i=='I03M' then//黑暗契约
  call UnitAddAbility( u, 'A0AS' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNOrbOfDarkness.blp" )
  call TriggerRegisterUnitEvent( gg_trg_DarkQiYue, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A0AS' )
  set udg_Ability1[n]='A0AS'
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
call SaveInteger(udg_Hash3,n,1,723)
call DisplayTextToPlayer( p, 0, 0, "已成功学习|cff1ce6b9"+GetAbilityName(udg_Ability1[n])+"|r" )
else
  set m=GetUnitAbilityLevel(u, udg_Ability1[n]) 
  if m!= 4 then
  call SetUnitAbilityLevel( u, udg_Ability1[n], m+1 )
  call DisplayTextToPlayer( p, 0, 0, "已成功升级|cff1ce6b9"+GetAbilityName(udg_Ability1[n])+"|r" )
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
function InitTrig_Ability4 takes nothing returns nothing
    set gg_trg_Ability4 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Ability4, gg_unit_nmr5_0105, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_Ability4, Condition( function Trig_Ability4_Conditions ) )
    call TriggerAddAction( gg_trg_Ability4, function Trig_Ability4_Actions )
endfunction
