
//===========================================================================
// Trigger: Buyhero1
//
// 每当有新英雄添加，就应该关注BKB和V弟的大的修改情况
// call SaveUnitHandle(udg_Hash2,GetHandleId(u),362,udg_lsu)//鑫头使用的单位
// call SaveInteger(udg_Hash3,GetHandleId(u),334,'A08K')
//===========================================================================
function Trig_Buyhero1_Actions takes nothing returns nothing
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
if i=='Udth' then//半边天
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSeaGiantGreen.blp" )
call TriggerRegisterUnitEvent( gg_trg_maoji, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_AroundChuanCiT, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Nplh' then//38h 
call TriggerRegisterUnitEvent( gg_trg_divewater, u, EVENT_UNIT_SPELL_CHANNEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp" )
//call TriggerRegisterUnitEvent( gg_trg_ghostship, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Otch' then//马脸
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNcentaur.blp" )
call TriggerRegisterUnitEvent( gg_trg_jiefangqiao, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Kuaimajiabian, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HorseSong, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Hpal' then//这老头
call TriggerRegisterUnitEvent( gg_trg_SpeddAddAttack, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_angleup, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ANsw')
call tiaozhengz(u)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp" )
call SetPlayerAbilityAvailable( p, 'A00C', false )
else
if i=='Udre' then//kimi
call TriggerRegisterUnitEvent( gg_trg_xixueguanghuan, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSkeletonArcher.blp" )
else
if i=='Npld' then//猛犸
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNBlueMagnataur.blp" )
call TriggerRegisterUnitEvent( gg_trg_liangjifanzhuan, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A09D')
call TriggerRegisterUnitEvent( gg_trg_shouyuliliang, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_tigaoshouyuliliang, u, EVENT_UNIT_HERO_LEVEL )
else
if i=='Oshd' then//猪哥
call TriggerRegisterUnitEvent( gg_trg_HAOZHU, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Arsq')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNRazorback.blp" )
call TriggerRegisterUnitEvent( gg_trg_piggrass, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Opgh' then//曾善祥
call DisableTrigger( gg_trg_fanji )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNChaosGrom.blp" )
call TriggerRegisterUnitEvent( gg_trg_Taunt, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Taotai, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_fanji, u, EVENT_UNIT_ATTACKED )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0AL')
call TriggerRegisterUnitEvent( gg_trg_Learnfanji, u, EVENT_UNIT_HERO_SKILL )
else
if i=='Uanb' then//SK
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNArachnathidGreen.blp" )
call TriggerRegisterUnitEvent( gg_trg_ImpleCast, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_EarthQuake, u, EVENT_UNIT_SPELL_FINISH )
else
if i=='Orex' then//狗叼
call TriggerRegisterUnitEvent( gg_trg_wolfup, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_AllT, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ACs7')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNWolf.blp" )
else
if i=='Udea' then//MYD
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroDeathKnight.blp" )
call TriggerRegisterUnitEvent( gg_trg_qiyue, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08J')
else
if i=='Ogrh' then//鑫头
//set udg_lsu=CreateUnit(p,'n001',0,0,0)
//call UnitAddItemToSlotById( udg_lsu, 'wshs', 0 )
//call SaveUnitHandle(udg_Hash2,GetHandleId(u),362,udg_lsu)
call TriggerRegisterUnitEvent( gg_trg_fulandengji, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_FulanOn, u, EVENT_UNIT_ISSUED_ORDER )
call TriggerRegisterUnitEvent( gg_trg_FulanOff, u, EVENT_UNIT_ISSUED_ORDER )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAbomination.blp" )
call TriggerRegisterUnitEvent( gg_trg_gouzi, u, EVENT_UNIT_SPELL_EFFECT )

call TriggerRegisterUnitEvent( gg_trg_FreshMeat, u, EVENT_UNIT_SPELL_EFFECT )

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
call SaveInteger(udg_Hash2,GetHandleId(u),8529,1)//1为力量2为敏捷3为智力
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set u=null
set p=null
endfunction

//===========================================================================
function InitTrig_Buyhero1 takes nothing returns nothing
    set gg_trg_Buyhero1 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Buyhero1, gg_unit_ntav_0004, EVENT_UNIT_SELL )
    call TriggerAddAction( gg_trg_Buyhero1, function Trig_Buyhero1_Actions )
endfunction
