
//===========================================================================
// Trigger: Buyhero7
//===========================================================================
function Trig_Buyhero7_Actions takes nothing returns nothing
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


if i=='O002' then//赏金
call TriggerRegisterUnitEvent( gg_trg_Tanlan, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_BaoFu, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNOgre.blp" )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_BaoFu),1,u)
else
if i=='E002' then//猩猩
call TriggerRegisterUnitEvent( gg_trg_jump, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_learnnature, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_learnaddstrong, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNJungleBeast.blp" )
else
if i=='O00A' then//混沌
call TriggerRegisterUnitEvent( gg_trg_zhimingyijiC, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_hunluanC, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNChaosWarlord.blp" )
else
if i=='H009' then//圣骑士
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroPaladin.blp" )
call TriggerRegisterUnitLifeEvent( gg_trg_hpdayuhundred, u, GREATER_THAN, 150.00 )
call TriggerRegisterUnitLifeEvent( gg_trg_hpxiaoyuling, u, LESS_THAN, 0.41 )
call TriggerRegisterUnitEvent( gg_trg_lvlupwithability, u, EVENT_UNIT_HERO_LEVEL )
call DisableTrigger( gg_trg_hpdayuhundred )
call SaveInteger(udg_Hash1,GetHandleId(gg_trg_addintel),1,0)
call TriggerRegisterUnitEvent( gg_trg_shengrevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_addshuxing, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_addintel, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zhufuzhiliao, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_shenshengshenpan, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_shandianshiye, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='U005' then//冰原
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMammoth.blp" )
call TriggerRegisterUnitEvent( gg_trg_bingya, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_arrow, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='O00B' then//蛮王
call wujindebaojieeee(u)
call DisableTrigger( gg_trg_wujindefennu )
call TriggerRegisterUnitEvent( gg_trg_wujindetili, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent(  gg_trg_wujindefennu, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent( gg_trg_shiyongfennu, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHellScream.blp" )
else
if i=='O00E' then//牛头人酋长
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroTaurenChieftain.blp" )
call TriggerRegisterUnitEvent( gg_trg_shenglinuhou, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_yemanchongzhuang, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='H00D' then//海洋之灾
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_sanxiangzhili),1,u)
call TriggerRegisterUnitEvent( gg_trg_shoudaoshanghaisanxiang, u, EVENT_UNIT_DAMAGED )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNICeTroll.blp" )
call TriggerRegisterUnitEvent( gg_trg_huaixuebingliaofa, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_sanxiangzhili, u, EVENT_UNIT_SPELL_EFFECT )
else
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
function InitTrig_Buyhero7 takes nothing returns nothing
    set gg_trg_Buyhero7 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Buyhero7, gg_unit_nmr8_0110, EVENT_UNIT_SELL )
    call TriggerAddAction( gg_trg_Buyhero7, function Trig_Buyhero7_Actions )
endfunction
