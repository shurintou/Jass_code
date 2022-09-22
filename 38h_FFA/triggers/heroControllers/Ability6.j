
//===========================================================================
// Trigger: Ability6
//
// endif
// if LoadInteger(udg_Hash3,n,3)==723 then
//===========================================================================




function Trig_Ability6_Conditions takes nothing returns boolean
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

function Trig_Ability6_Actions takes nothing returns nothing
local unit u=udg_PlayerLockToHero[GetConvertedPlayerId(GetOwningPlayer(GetBuyingUnit()))]
local integer i=GetItemTypeId(GetSoldItem())
local player p=GetOwningPlayer(u)
local integer n=GetConvertedPlayerId(p)
local integer m=0

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
  
  if i=='I02S' then//野性之心
  call UnitAddAbility( u, 'AOae' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNEnchantedBears.blp" )
  call UnitMakeAbilityPermanent( u, true, 'AOae' )
  set udg_Ability3[n]='AOae'
  else
  if i=='I02T' then//辉煌光环
  call UnitAddAbility( u, 'AHab' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNBrilliance.blp" )

  call UnitMakeAbilityPermanent( u, true, 'AHab' )
  set udg_Ability3[n]='AHab'
  else
  if i=='I02X' then//命令光环
  call UnitAddAbility( u, 'A05T' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNGnollCommandAura.blp" )

  call UnitMakeAbilityPermanent( u, true, 'A05T' )
  set udg_Ability3[n]='A05T'
  else
  if i=='I031' then//幽冥剧毒
  call UnitAddAbility( u, 'A06D' )
  call UnitAddAbility( u, 'A06E' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNPoisonArrow.blp" )
  call TriggerRegisterUnitEvent( gg_trg_PoisonAttack, u, EVENT_UNIT_TARGET_IN_RANGE )
  call UnitMakeAbilityPermanent( u, true, 'A06D' )
  set udg_Ability3[n]='A06D'
  else
  if i=='I034' then//屠戮
  call UnitAddAbility( u, 'A076' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNVampiricAura.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A076' )
  set udg_Ability3[n]='A076'
  else
  if i=='I035' then//施虐之心
  call UnitAddAbility( u, 'A077' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNOrbOfCorruption.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A077' )
  set udg_Ability3[n]='A077'
  else
  if i=='I03G' then//崎岖外表
  call UnitAddAbility( u, 'A0A5' )
  set udg_lsu=CreateUnit(GetOwningPlayer(u),'n001',0,0,0)
  call UnitAddAbility(udg_lsu,'A0A6')
  call SaveUnitHandle(udg_Hash2,GetHandleId(u),3793,udg_lsu)
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNResistantSkin.blp" )
  call TriggerRegisterUnitEvent( gg_trg_Qiqupifu, u, EVENT_UNIT_ATTACKED )
  call UnitMakeAbilityPermanent( u, true, 'A0A5' )
  set udg_Ability3[n]='A0A5'
  else
  if i=='I03H' then//巨石力量
  call UnitAddAbility( u, 'A04R' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHardenedSkin.blp" )

  call UnitMakeAbilityPermanent( u, true, 'A04R' )
  set udg_Ability3[n]='A04R'
  else
  if i=='I03I' then//盛宴
  call UnitAddAbility( u, 'A0A7' )
  call TriggerRegisterUnitEvent( gg_trg_ShengYan, u, EVENT_UNIT_TARGET_IN_RANGE )

  call UnitMakeAbilityPermanent( u, true, 'A0A7' )
  set udg_Ability3[n]='A0A7'
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNCannibalize.blp" )
  else
  if i=='I03O' then//精气光环
  call UnitAddAbility( u, 'A0AZ' )
  call TriggerRegisterUnitEvent(gg_trg_JingQi, u, EVENT_UNIT_SPELL_EFFECT )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNScatterRockets.blp")

  call UnitMakeAbilityPermanent( u, true, 'A0AZ' )
  set udg_Ability3[n]='A0AZ'
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
function InitTrig_Ability6 takes nothing returns nothing
    set gg_trg_Ability6 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Ability6, gg_unit_nmr7_0107, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_Ability6, Condition( function Trig_Ability6_Conditions ) )
    call TriggerAddAction( gg_trg_Ability6, function Trig_Ability6_Actions )
endfunction
