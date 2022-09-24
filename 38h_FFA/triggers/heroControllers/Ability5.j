
//===========================================================================
// Trigger: Ability5
//===========================================================================
function Trig_Ability5_Conditions takes nothing returns boolean
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

function Trig_Ability5_Actions takes nothing returns nothing
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
  
  if i=='I02E' then//变相移动
  call UnitAddAbility( u, 'Apsh' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNPhaseShiftOn.blp" )
  call UnitMakeAbilityPermanent( u, true, 'Apsh' )
  set udg_Ability2[n]='Apsh'
  else
  if i=='I02K' then//双刃剑
  call UnitAddAbility( u, 'A058' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNArcaniteMelee.blp" )
  call TriggerRegisterUnitEvent( gg_trg_DoubleSword, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A058' )
  set udg_Ability2[n]='A058'
  else
  if i=='I02U' then//蛛网
  call UnitAddAbility( u, 'A05O' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNWeb.blp" )
  call TriggerRegisterUnitEvent( gg_trg_Web, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A05O' )
  set udg_Ability2[n]='A05O'
  else
  if i=='I02V' then//隐身
  call UnitAddAbility( u, 'A05P' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp" )
  call UnitMakeAbilityPermanent( u, true, 'A05P' )
  set udg_Ability2[n]='A05P'
  else
  if i=='I02Z' then//发芽
  call UnitAddAbility( u, 'A069' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNForceOfNature.blp" )
  call TriggerRegisterUnitEvent( gg_trg_PlantTree, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A069' )
  set udg_Ability2[n]='A069'
  else
  if i=='I033' then//薄葬
    if IsTriggerEnabled(gg_trg_bozangharm) then
    else
    call EnableTrigger( gg_trg_bozangharm )
    endif
  call UnitAddAbility( u, 'A074' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAnkh.blp" )
  call TriggerRegisterUnitEvent( gg_trg_bozang2, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A074' )
  set udg_Ability2[n]='A074'
  else
  if i=='I038' then//灵魂锁链
  call UnitAddAbility( u, 'Aspl' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDizzy.blp" )
  call UnitMakeAbilityPermanent( u, true, 'Aspl' )
  set udg_Ability2[n]='Aspl'
  else
  if i=='I03B' then//查克拉魔法
  call UnitAddAbility( u, 'A09P' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNCharm.blp" )
  call TriggerRegisterUnitEvent( gg_trg_ChaKeLa, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A09P' )
  set udg_Ability2[n]='A09P'
  else
  if i=='I03C' then//活血术
  call UnitAddAbility( u, 'A09U' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNRegenerate.blp" )
  call TriggerRegisterUnitEvent(gg_trg_huoxueshu, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A09U' )
  set udg_Ability2[n]='A09U'
  else
  if i=='I03N' then//撕裂伤口
  call UnitAddAbility( u, 'A0AW' )
  call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNShamanMaster.blp" )
  call TriggerRegisterUnitEvent(gg_trg_SiLie, u, EVENT_UNIT_SPELL_EFFECT )
  call UnitMakeAbilityPermanent( u, true, 'A0AW' )
  set udg_Ability2[n]='A0AW'
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
function InitTrig_Ability5 takes nothing returns nothing
    set gg_trg_Ability5 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Ability5, gg_unit_nmr6_0106, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_Ability5, Condition( function Trig_Ability5_Conditions ) )
    call TriggerAddAction( gg_trg_Ability5, function Trig_Ability5_Actions )
endfunction
