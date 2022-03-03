
//===========================================================================
// Trigger: Buyhero6
//
// //call TriggerRegisterUnitEvent(   gg_trg_Spirit, u, EVENT_UNIT_SPELL_EFFECT )
// //call TriggerRegisterUnitEvent( gg_trg_StopSpirit, u, EVENT_UNIT_SPELL_ENDCAST )
// //巫妖的技能，先不用了，改成冰封球
//===========================================================================
function Trig_Buyhero6_Actions takes nothing returns nothing
local unit u= GetSoldUnit()
local integer i=GetUnitTypeId(u)
local player p=GetOwningPlayer(u)
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)

call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
//call RemoveUnit( GetBuyingUnit() )
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
//call SetUnitColor( u, PLAYER_COLOR_BLUE )
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12

if i=='Hjai' then//ZMT
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNJaina.blp" )
call TriggerRegisterUnitEvent( gg_trg_CreateWeatherd, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_stopsnow, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_qixue, u, EVENT_UNIT_SPELL_FINISH )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0BT')
else
if i=='Emfr' then//phoenix
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Avng')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMarkOfFire.blp" )
call TriggerRegisterUnitEvent( gg_trg_HolyKill, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_fenghuangniao, u, EVENT_UNIT_HERO_LEVEL )
else
if i=='Ekgg' then//稀烂的球魁
//call SetUnitColor( u, PLAYER_COLOR_YELLOW )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Arej')
call TriggerRegisterUnitEvent( gg_trg_fanlaohuantong, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNWisp.blp" )
else
if i=='Hant' then//大仙
call TriggerRegisterUnitEvent(  gg_trg_ElectricalBomb, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_quanlingyujimo, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSpellBreaker.blp" )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_quanlingyujimo),1,u)
else
if i=='Uwar' then//51
call TriggerRegisterUnitEvent(  gg_trg_wudu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_swudu, u, EVENT_UNIT_SPELL_ENDCAST )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Ahwd')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNWitchDoctor.blp" )
else
if i=='Hmbr' then//3Q
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAvatar.blp" )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08G')
call TriggerRegisterUnitEvent(  gg_trg_ElectricSquare, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(  gg_trg_AngryElec, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_shandianlian, u, EVENT_UNIT_HERO_LEVEL )
else
if i=='Hgam' then//BV
set udg_lsu=CreateUnit(p,'n001',-270,-620,0)
call UnitAddItemToSlotById( udg_lsu, 'rsps', 0 )
call SaveUnitHandle(udg_Hash2,GetHandleId(u),4620,udg_lsu)
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A09H')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNPriest.blp" )  
call TriggerRegisterUnitEvent(   gg_trg_GodHand, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(   gg_trg_LinkenHudun, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Uktl' then//巫妖
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNLichVersion2.blp" )
call TriggerRegisterUnitEvent(   gg_trg_DarkThrough, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(   gg_trg_lianhuanshuangdong, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(   gg_trg_shuangdongliliang, u, EVENT_UNIT_SPELL_EFFECT )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_lianhuanshuangdong),1,u)
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A071')
else
if i=='Ecen' then//蠢东西
call TriggerRegisterUnitEvent( gg_trg_zhuanyi, u, EVENT_UNIT_SPELL_CHANNEL )
call TriggerRegisterUnitEvent( gg_trg_jinghua, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSummonWaterElemental.blp" )
else
if i=='Nman' then//皮包骨
call TriggerRegisterUnitEvent( gg_trg_UpSHUailao, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AHbn')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSkeletonMage.blp" )
else
if i=='Uvar' then//海民
call TriggerRegisterUnitEvent( gg_trg_HuiJi, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_AttackWithHuiJi, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_PanDuanHuiJi, u, EVENT_UNIT_DAMAGED )
call DisableTrigger( gg_trg_PanDuanHuiJi )
call DisableTrigger( gg_trg_AttackWithHuiJi )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNTuskaarGold.blp" )
else
if i=='Ogld' then//MAY  
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNVoidWalker.blp" )
call TriggerRegisterUnitEvent( gg_trg_StopLiaoKao, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_YuanLiLiaoKao, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_ChuansongBlink, u, EVENT_UNIT_SPELL_EFFECT )
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
endif

call unaviliable(i)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,3)//1为力量2为敏捷3为智力
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set u=null
set p=null
endfunction

//===========================================================================
function InitTrig_Buyhero6 takes nothing returns nothing
    set gg_trg_Buyhero6 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Buyhero6, gg_unit_nmrb_0145, EVENT_UNIT_SELL )
    call TriggerAddAction( gg_trg_Buyhero6, function Trig_Buyhero6_Actions )
endfunction
