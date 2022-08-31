
//===========================================================================
// Trigger: Ability
//
// udg_Hash3,玩家索引，1，判断是否学过该类技能
// udg_Hash2,玩家索引，72，73，74玩家购买过的技能卷轴
// call UnitAddAbility( null, 'A041' )
// call SetUnitAbilityLevel( null, 'A041', GetUnitAbilityLevel(GetTriggerUnit(), 'A041') )
// call SetPlayerAbilityAvailable( Player(0), 'A041', false )
//===========================================================================
function Trig_Ability_Conditions takes nothing returns boolean
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



function Trig_Ability_Actions takes nothing returns nothing
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
  if i=='I01R' then//光之箭
  call UnitAddAbility( u, 'A04B' )
  call TriggerRegisterUnitEvent( gg_trg_LightAcher, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSearingArrows.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A04B' )
  set udg_Ability1[n]='A04B'
  else
  if i=='I01U' then//真空
  call UnitAddAbility( u, 'A04G' )
  call TriggerRegisterUnitEvent( gg_trg_TrueEmpty, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNWispSplode.blp" )  
  call UnitMakeAbilityPermanent( u, true, 'A04G' )
  set udg_Ability1[n]='A04G'
  else
  if i=='I01V' then//洪流
  call UnitAddAbility( u, 'A04H' )
  call TriggerRegisterUnitEvent( gg_trg_Drought, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNNeutralManaShield.blp" )  
  call UnitMakeAbilityPermanent( u, true, 'A04H' )
  set udg_Ability1[n]='A04H'
  else
  if i=='I01X' then//大地之缚
  call UnitAddAbility( u, 'A04L' )
  call TriggerRegisterUnitEvent( gg_trg_NewGroundSF, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNQuillSpray.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A04L' )
  set udg_Ability1[n]='A04L'
  else
  if i=='I01Y' then//暗影波
  call UnitAddAbility( u, 'ANhw' )
  call TriggerRegisterUnitEvent( gg_trg_DarkShadowWave, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHealingWave.blp" )
  call UnitMakeAbilityPermanent( u, true, 'ANhw' )
  set udg_Ability1[n]='ANhw'
  else
  if i=='I01Z' then//死亡脉冲
  call UnitAddAbility( u, 'A04M' )
  call TriggerRegisterUnitEvent( gg_trg_DeadRush, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A04M' )
  set udg_Ability1[n]='A04M'
  else
  if i=='I020' then//阳炎冲击
  call UnitAddAbility( u, 'A04P' )
  call TriggerRegisterUnitEvent( gg_trg_SkyFire, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFire.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A04P' )
  set udg_Ability1[n]='A04P'
  else
  if i=='I021' then//新月之痕
  call UnitAddAbility( u, 'A04Q' )
  call TriggerRegisterUnitEvent( gg_trg_Moonw, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNPriestMaster.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A04Q' )
  set udg_Ability1[n]='A04Q'
  else
  if i=='I022' then//恐怖波动
  call UnitAddAbility( u, 'A04T' )
  call TriggerRegisterUnitEvent( gg_trg_TerribleHowl, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHowlOfTerror.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A04T' )
  set udg_Ability1[n]='A04T'
  else
  if i=='I023' then//洗礼
  call UnitAddAbility( u, 'AHhb' )
  call TriggerRegisterUnitEvent( gg_trg_HolyLight, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHolyBolt.blp" )
  call UnitMakeAbilityPermanent( u, true, 'AHhb' )
  set udg_Ability1[n]='AHhb'
  else
  if i=='I024' then//超声波
  call UnitAddAbility( u, 'A04V' )
  call TriggerRegisterUnitEvent( gg_trg_QuakeWave, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNScatterRockets.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A04V' )
  set udg_Ability1[n]='A04V'
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
function InitTrig_Ability takes nothing returns nothing
    set gg_trg_Ability = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Ability, gg_unit_nmer_0003, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_Ability, Condition( function Trig_Ability_Conditions ) )
    call TriggerAddAction( gg_trg_Ability, function Trig_Ability_Actions )
endfunction
